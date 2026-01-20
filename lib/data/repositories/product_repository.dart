import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../models/models.dart' as models;
import '../sources/local/app_database.dart' as db;
import '../sources/remote/supabase_client.dart';
import '../../core/utils/connectivity_helper.dart';
import 'package:drift/drift.dart';

/// Repository for managing products with online/offline sync
class ProductRepository {
  final db.AppDatabase _localDb;
  final SupabaseDataSource _remoteDb;
  final ConnectivityHelper _connectivity;

  ProductRepository({
    required db.AppDatabase localDb,
    required SupabaseDataSource remoteDb,
    required ConnectivityHelper connectivity,
  }) : _localDb = localDb,
       _remoteDb = remoteDb,
       _connectivity = connectivity;

  // ═══════════════════════════════════════════════════════════════
  // BRANDS
  // ═══════════════════════════════════════════════════════════════

  /// Get all brands (offline-first) - returns Drift Brand objects
  Future<List<db.Brand>> getAllBrands() async {
    // Try to sync if online
    if (await _connectivity.hasConnection()) {
      await _syncBrands();
    }
    // Return from local database
    return _localDb.getAllBrands();
  }

  /// Convert Drift Brand to model Brand
  models.Brand toBrandModel(db.Brand dbBrand) {
    return models.Brand(
      id: dbBrand.id,
      name: dbBrand.name,
      logoUrl: dbBrand.logoUrl,
      description: {
        if (dbBrand.descriptionFr != null) 'fr': dbBrand.descriptionFr!,
        if (dbBrand.descriptionEn != null) 'en': dbBrand.descriptionEn!,
      },
      createdAt: dbBrand.createdAt,
    );
  }

  /// Sync brands from Supabase to local
  Future<void> _syncBrands() async {
    try {
      final remoteBrands = await _remoteDb.fetchAllBrands();
      final companions = remoteBrands
          .map(
            (json) => db.BrandsCompanion(
              id: Value(json['id'] as String),
              name: Value(json['name'] as String),
              logoUrl: Value(json['logo_url'] as String?),
              descriptionFr: Value(
                (json['description'] as Map?)?['fr'] as String?,
              ),
              descriptionEn: Value(
                (json['description'] as Map?)?['en'] as String?,
              ),
              createdAt: Value(
                json['created_at'] != null
                    ? DateTime.parse(json['created_at'] as String)
                    : null,
              ),
              iconUrl: Value(json['icon_url'] as String?),
            ),
          )
          .toList();
      await _localDb.insertBrands(companions);
    } catch (e) {
      // Silently fail - will use cached data
      debugPrint('Seeding local DB...');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // PRODUCTS
  // ═══════════════════════════════════════════════════════════════

  /// Get all products (offline-first) - returns Drift Product objects
  Future<List<db.Product>> getAllProducts() async {
    if (await _connectivity.hasConnection()) {
      try {
        final remoteData = await _remoteDb.fetchAllProducts();
        final tagMap = await _getKeyToValueMap(
          _localDb.getAllTags(),
          (t) => t.id,
          (t) => t.labelFr,
        );
        final certMap = await _getKeyToValueMap(
          _localDb.getAllCertifications(),
          (c) => c.id,
          (c) => c.nameFr,
        );

        return remoteData
            .map((json) => _mapJsonToDbProduct(json, tagMap, certMap))
            .toList();
      } catch (e) {
        debugPrint('Online fetch all products failed: $e');
        return [];
      }
    }
    // Online-only: Return empty if offline
    return [];
  }

  /// Get products by brand (offline-first)
  Future<List<db.Product>> getProductsByBrand(String brandId) async {
    if (await _connectivity.hasConnection()) {
      await _syncProducts();
    }
    return _localDb.getProductsByBrand(brandId);
  }

  /// Search products (works offline too!)
  Future<List<db.Product>> searchProducts(String query) async {
    // If online, try remote search first for freshest results
    if (await _connectivity.hasConnection()) {
      try {
        final remoteResults = await _remoteDb.searchProducts(query);
        if (remoteResults.isNotEmpty) {
          // Sync to local and return from local for consistency
          await _syncProducts();
        }
      } catch (e) {
        debugPrint('Sync failed: $e. Attempting local seed...');
      }
    }
    // Fall back to local search
    return _localDb.searchProducts(query);
  }

  /// Paginated fetch with filtering
  Future<List<db.Product>> getPaginatedProducts({
    required int limit,
    required int offset,
    String? searchQuery,
    List<String>? brandIds,
    List<String>? forms,
    String? category,
  }) async {
    // ONLINE MODE: Fetch from Supabase
    if (await _connectivity.hasConnection()) {
      try {
        final remoteData = await _remoteDb.fetchAllProducts();

        // Map to Drift objects and Filter in Memory
        final tagMap = await _getKeyToValueMap(
          _localDb.getAllTags(),
          (t) => t.id,
          (t) => t.labelFr,
        );
        final certMap = await _getKeyToValueMap(
          _localDb.getAllCertifications(),
          (c) => c.id,
          (c) => c.nameFr,
        );

        var products = remoteData
            .map((json) => _mapJsonToDbProduct(json, tagMap, certMap))
            .toList();

        // 1. Search (Name/Tags)
        if (searchQuery != null && searchQuery.isNotEmpty) {
          final query = searchQuery.toLowerCase();
          products = products.where((p) {
            return p.nameFr.toLowerCase().contains(query) ||
                (p.nameEn?.toLowerCase().contains(query) ?? false) ||
                (p.scientificName?.toLowerCase().contains(query) ?? false) ||
                (p.tags?.toLowerCase().contains(query) ?? false);
          }).toList();
        }

        // 2. Brand Filter
        if (brandIds != null && brandIds.isNotEmpty) {
          products = products
              .where((p) => brandIds.contains(p.brandId))
              .toList();
        }

        // 3. Form Filter
        if (forms != null && forms.isNotEmpty) {
          products = products.where((p) => forms.contains(p.form)).toList();
        }

        // 4. Category Filter
        if (category != null && category.isNotEmpty) {
          products = products.where((p) => p.category == category).toList();
        }

        // Pagination
        final startIndex = offset;
        final endIndex = (startIndex + limit) < products.length
            ? (startIndex + limit)
            : products.length;

        if (startIndex >= products.length) return [];
        return products.sublist(startIndex, endIndex);
      } catch (e) {
        debugPrint('Online fetch failed: $e');
        // Fallback to local? Or return empty?
        // User wants online-first. If fails, likely connection issue.
        // Return empty or throw.
        return [];
      }
    }

    // OFFLINE MODE: Returns EMPTY (catalog is online-only)
    // Favorites are accessed via separate provider.
    return [];
  }

  /// Convert Drift Product to model Product
  models.Product toProductModel(db.Product dbProduct) {
    return models.Product(
      id: dbProduct.id,
      brandId: dbProduct.brandId,
      name: {
        'fr': dbProduct.nameFr,
        if (dbProduct.nameEn != null) 'en': dbProduct.nameEn!,
      },
      scientificName: dbProduct.scientificName,
      form: models.ProductForm.fromString(dbProduct.form),
      category: models.ProductCategory.fromString(dbProduct.category),
      weightVolume: dbProduct.weightVolume,
      ingredients: dbProduct.ingredients != null
          ? List<String>.from(jsonDecode(dbProduct.ingredients!) as List)
          : null,
      certifications: dbProduct.certifications != null
          ? List<String>.from(jsonDecode(dbProduct.certifications!) as List)
          : null,
      imageUrl: dbProduct.imageUrl,
      galleryUrls: dbProduct.galleryUrls != null
          ? List<String>.from(jsonDecode(dbProduct.galleryUrls!) as List)
          : null,
      tags: dbProduct.tags != null
          ? List<String>.from(jsonDecode(dbProduct.tags!) as List)
          : null,
      bienfaits: {
        if (dbProduct.bienfaitsFr != null)
          'fr': List<String>.from(jsonDecode(dbProduct.bienfaitsFr!) as List),
        if (dbProduct.bienfaitsEn != null)
          'en': List<String>.from(jsonDecode(dbProduct.bienfaitsEn!) as List),
      },
      usages: dbProduct.usages != null
          ? (jsonDecode(dbProduct.usages!) as List)
                .map(
                  (e) =>
                      models.UsageSection.fromJson(e as Map<String, dynamic>),
                )
                .toList()
          : null,
      isActive: dbProduct.isActive,
      createdAt: dbProduct.createdAt,
      updatedAt: dbProduct.updatedAt,
    );
  }

  /// Sync products from Supabase to local
  Future<void> _syncProducts() async {
    try {
      final remoteProducts = await _remoteDb.fetchAllProducts();

      // Pre-fetch relation maps for name resolution
      final tagMap = await _getKeyToValueMap(
        _localDb.getAllTags(),
        (t) => t.id,
        (t) => t.labelFr,
      );
      final certMap = await _getKeyToValueMap(
        _localDb.getAllCertifications(),
        (c) => c.id,
        (c) => c.nameFr,
      );

      final companions = remoteProducts
          .map((json) => _mapJsonToCompanion(json, tagMap, certMap))
          .toList();
      await _localDb.insertProducts(companions);
    } catch (e) {
      debugPrint('Product sync failed: $e');
    }
  }

  // Helper to build Maps efficiently
  Future<Map<K, V>> _getKeyToValueMap<T, K, V>(
    Future<List<T>> futureList,
    K Function(T) keySelector,
    V Function(T) valueSelector,
  ) async {
    final list = await futureList;
    return {for (var item in list) keySelector(item): valueSelector(item)};
  }

  /// Sync tags
  Future<void> _syncTags() async {
    try {
      final remote = await _remoteDb.fetchTags();
      final companions = remote
          .map(
            (json) => db.TagsCompanion(
              id: Value(json['id'] as String),
              labelFr: Value(json['label_fr'] as String),
              labelEn: Value(json['label_en'] as String?),
            ),
          )
          .toList();
      await _localDb.insertTags(companions);
    } catch (e) {
      debugPrint('Tags sync failed: $e');
    }
  }

  /// Sync certifications
  Future<void> _syncCertifications() async {
    try {
      final remote = await _remoteDb.fetchCertifications();
      final companions = remote
          .map(
            (json) => db.CertificationsCompanion(
              id: Value(json['id'] as String),
              nameFr: Value((json['name'] as Map)['fr'] as String),
              nameEn: Value((json['name'] as Map?)?['en'] as String?),
              logoUrl: Value(json['logo_url'] as String?),
            ),
          )
          .toList();
      await _localDb.insertCertifications(companions);
    } catch (e) {
      debugPrint('Certifications sync failed: $e');
    }
  }

  Future<List<db.Tag>> getAllTags() async {
    if (await _connectivity.hasConnection()) {
      await _syncTags();
    }
    return _localDb.getAllTags();
  }

  Future<List<db.Certification>> getAllCertifications() async {
    if (await _connectivity.hasConnection()) {
      await _syncCertifications();
    }
    return _localDb.getAllCertifications();
  }

  /// Get tags specifically for a product
  Future<List<db.Tag>> getTagsForProduct(String productId) async {
    return _localDb.getTagsForProduct(productId);
  }

  /// Get certifications specifically for a product
  Future<List<db.Certification>> getCertificationsForProduct(
    String productId,
  ) async {
    return _localDb.getCertificationsForProduct(productId);
  }

  // ═══════════════════════════════════════════════════════════════
  // LABELS
  // ═══════════════════════════════════════════════════════════════

  /// Get category labels (Online First)
  Future<List<db.CategoryLabel>> getCategoryLabels() async {
    if (await _connectivity.hasConnection()) {
      await _syncCategoryLabels();
    }
    return _localDb.getAllCategoryLabels();
  }

  /// Sync category labels
  Future<void> _syncCategoryLabels() async {
    try {
      final remote = await _remoteDb.fetchCategoryLabels();
      final companions = remote.map((json) {
        // label is already a JSON map/string in remote, or we construct it
        // The table expects 'label' as a String (JSON)
        final labelMap = json['label'] as Map;
        return db.CategoryLabelsCompanion(
          key: Value(json['key'] as String),
          label: Value(jsonEncode(labelMap)),
          color: Value(json['color'] as String?),
          iconUrl: Value(json['icon_url'] as String?),
        );
      }).toList();
      await _localDb.insertCategoryLabels(companions);
    } catch (e) {
      debugPrint('CategoryLabels sync failed: $e');
    }
  }

  /// Sync form labels
  Future<void> _syncFormLabels() async {
    try {
      final remote = await _remoteDb.fetchFormLabels();
      final companions = remote.map((json) {
        final labelMap = json['label'] as Map;
        return db.FormLabelsCompanion(
          key: Value(json['key'] as String),
          label: Value(jsonEncode(labelMap)),
        );
      }).toList();
      await _localDb.insertFormLabels(companions);
    } catch (e) {
      debugPrint('FormLabels sync failed: $e');
    }
  }

  /// Force sync all data
  Future<void> forceSync() async {
    if (await _connectivity.hasConnection()) {
      // Labels (Metadata)
      await _syncCategoryLabels();
      await _syncFormLabels();
      await _syncArticleCategoryLabels();

      // Relations First (for Name Resolution)
      await _syncTags();
      await _syncCertifications();

      // Core Data
      await _syncBrands();
      await _syncProducts();
      await _syncArticles();
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // ARTICLES (Journal)
  // ═══════════════════════════════════════════════════════════════

  /// Get all articles (offline-first)
  Future<List<db.Article>> getAllArticles() async {
    if (await _connectivity.hasConnection()) {
      await _syncArticles();
    }
    return _localDb.getAllArticles();
  }

  Future<db.Article?> getArticleById(String id) {
    return _localDb.getArticleById(id);
  }

  Future<void> _syncArticles() async {
    try {
      final remote = await _remoteDb.fetchArticles();
      final companions = remote.map((json) {
        // Handle localized JSON fields safely - just store the generic Map as JSON string
        final titleMap = json['title'] is Map
            ? json['title']
            : {'fr': json['title']};
        final excerptMap = json['excerpt'] is Map
            ? json['excerpt']
            : {'fr': json['excerpt']};
        final contentMap = json['content'] is Map
            ? json['content']
            : {'fr': json['content']};

        return db.ArticlesCompanion(
          id: Value(json['id'] as String),
          title: Value(jsonEncode(titleMap)),
          excerpt: Value(excerptMap != null ? jsonEncode(excerptMap) : null),
          content: Value(contentMap != null ? jsonEncode(contentMap) : null),
          category: Value(json['category'] as String),
          featureImageUrl: Value(json['feature_image_url'] as String?),
          // No readTime anymore
          isActive: Value(json['is_active'] as bool? ?? true),
          publishedAt: Value(
            json['published_at'] != null
                ? DateTime.parse(json['published_at'] as String)
                : null,
          ),
          // JSON fields if present
          tags: Value(json['tags'] != null ? jsonEncode(json['tags']) : null),
          relatedProductIds: Value(
            json['related_product_ids'] != null
                ? jsonEncode(json['related_product_ids'])
                : null,
          ),
        );
      }).toList();
      await _localDb.insertArticles(companions);
    } catch (e) {
      debugPrint('Article sync failed: $e');
    }
  }

  Future<void> _syncArticleCategoryLabels() async {
    try {
      final remote = await _remoteDb.fetchArticleCategoryLabels();
      final companions = remote.map((json) {
        final labelMap = json['label'] as Map;
        return db.ArticleCategoryLabelsCompanion(
          key: Value(json['key'] as String),
          label: Value(jsonEncode(labelMap)),
        );
      }).toList();
      await _localDb.insertArticleCategoryLabels(
        companions,
      ); // Add this method to AppDatabase if missing, or use batch generic
    } catch (e) {
      debugPrint('ArticleCategoryLabels sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // FAVORITES
  // ═══════════════════════════════════════════════════════════════

  /// Watch favorite product IDs
  Stream<List<String>> watchFavoriteIds() {
    return _localDb.watchFavoriteProductIds();
  }

  Stream<List<String>> watchFavoriteArticleIds() {
    return _localDb.watchFavoriteArticleIds();
  }

  /// Get favorite product IDs one-time
  Future<List<String>> getFavoriteIds() {
    return _localDb.getFavoriteIds().then((ids) {
      return ids.whereType<String>().toList();
    });
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(String productId) async {
    debugPrint('Toggling favorite for $productId');
    try {
      // Ensure product exists in local DB before favoriting (FK Constraint)
      final existing = await _localDb.getProductById(productId);
      if (existing == null) {
        debugPrint('Product $productId not in local DB. Fetching...');
        if (await _connectivity.hasConnection()) {
          final remoteJson = await _remoteDb.fetchProductById(productId);
          if (remoteJson != null) {
            debugPrint('Remote product found. Inserting...');

            // 1. Ensure Brand exists (FK Constraint)
            final brandId = remoteJson['brand_id'] as String;
            final existingBrand = await _localDb.getBrandById(
              brandId,
            ); // Ensure this method exists and is public
            if (existingBrand == null) {
              debugPrint('Brand $brandId not found locally. Fetching...');
              try {
                final brandJson = await _remoteDb.fetchBrandById(brandId);
                if (brandJson != null) {
                  final brandCompanion = db.BrandsCompanion(
                    id: Value(brandJson['id'] as String),
                    name: Value(brandJson['name'] as String),
                    logoUrl: Value(brandJson['logo_url'] as String?),
                    iconUrl: Value(brandJson['icon_url'] as String?),
                    descriptionFr: Value(
                      (brandJson['description'] as Map?)?['fr'] as String?,
                    ),
                    descriptionEn: Value(
                      (brandJson['description'] as Map?)?['en'] as String?,
                    ),
                    createdAt: Value(
                      brandJson['created_at'] != null
                          ? DateTime.parse(brandJson['created_at'] as String)
                          : null,
                    ),
                  );
                  await _localDb.insertOrUpdateBrand(
                    brandCompanion,
                  ); // Ensure this method exists
                  debugPrint('Brand inserted.');
                } else {
                  debugPrint('Brand $brandId not found on remote!');
                  // Proceeding might fail if brand FK is strict
                }
              } catch (e) {
                debugPrint('Error fetching/inserting brand: $e');
              }
            }

            // Fetch maps specifically for this single product fallback
            final tagMap = await _getKeyToValueMap(
              _localDb.getAllTags(),
              (t) => t.id,
              (t) => t.labelFr,
            );
            final certMap = await _getKeyToValueMap(
              _localDb.getAllCertifications(),
              (c) => c.id,
              (c) => c.nameFr,
            );

            // Convert JSON to Companion
            final companion = _mapJsonToCompanion(remoteJson, tagMap, certMap);
            await _localDb.insertOrUpdateProduct(companion);
            debugPrint('Product inserted successfully.');
          } else {
            debugPrint('Remote product not found!');
          }
        } else {
          debugPrint('No connection to fetch product details.');
        }
      } else {
        debugPrint('Product already exists locally.');
      }
      await _localDb.toggleProductFavorite(productId);
      debugPrint('Favorite toggled in DB.');
    } catch (e, stack) {
      debugPrint('Error toggling favorite: $e\n$stack');
    }
  }

  // Helper: JSON -> DB Product
  db.Product _mapJsonToDbProduct(
    Map<String, dynamic> json,
    Map<String, String> tagMap,
    Map<String, String> certMap,
  ) {
    // Resolve Arrays
    final tagsIds = json['tags_ids'] != null
        ? List<String>.from(json['tags_ids'])
        : <String>[];
    final certsIds = json['certifications_ids'] != null
        ? List<String>.from(json['certifications_ids'])
        : <String>[];

    // Resolve Names
    final tagNames = tagsIds
        .map((id) => tagMap[id] ?? '')
        .where((n) => n.isNotEmpty)
        .toList();
    final certNames = certsIds
        .map((id) => certMap[id] ?? '')
        .where((n) => n.isNotEmpty)
        .toList();

    return db.Product(
      id: json['id'] as String,
      brandId: json['brand_id'] as String,
      nameFr: (json['name'] as Map)['fr'] as String? ?? '',
      nameEn: (json['name'] as Map)['en'] as String?,
      scientificName: json['scientific_name'] as String?,
      form: json['form'] as String?,
      category: json['category'] as String?,
      weightVolume: json['weight_volume'] as String?,
      ingredients: json['ingredients'] != null
          ? jsonEncode(json['ingredients'])
          : null,
      certifications: jsonEncode(certNames),
      certificationsIds: jsonEncode(certsIds),
      tags: jsonEncode(tagNames),
      tagsIds: jsonEncode(tagsIds),
      imageUrl: json['image_url'] as String?,
      galleryUrls: json['gallery_urls'] != null
          ? jsonEncode(json['gallery_urls'])
          : null,
      excerptFr: (json['excerpt'] as Map?)?['fr'] as String?,
      excerptEn: (json['excerpt'] as Map?)?['en'] as String?,
      bienfaitsFr: (json['bienfaits'] as Map?)?['fr'] != null
          ? jsonEncode((json['bienfaits'] as Map)['fr'])
          : null,
      bienfaitsEn: (json['bienfaits'] as Map?)?['en'] != null
          ? jsonEncode((json['bienfaits'] as Map)['en'])
          : null,
      expertNoteFr: (json['expert_note'] as Map?)?['fr'] as String?,
      expertNoteEn: (json['expert_note'] as Map?)?['en'] as String?,
      usages: json['usages'] != null ? jsonEncode(json['usages']) : null,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  // Helper: JSON -> Companion
  db.ProductsCompanion _mapJsonToCompanion(
    Map<String, dynamic> json,
    Map<String, String> tagMap,
    Map<String, String> certMap,
  ) {
    // Resolve Arrays
    final tagsIds = json['tags_ids'] != null
        ? List<String>.from(json['tags_ids'])
        : <String>[];
    final certsIds = json['certifications_ids'] != null
        ? List<String>.from(json['certifications_ids'])
        : <String>[];

    // Resolve Names
    final tagNames = tagsIds
        .map((id) => tagMap[id] ?? '')
        .where((n) => n.isNotEmpty)
        .toList();
    final certNames = certsIds
        .map((id) => certMap[id] ?? '')
        .where((n) => n.isNotEmpty)
        .toList();

    return db.ProductsCompanion(
      id: Value(json['id'] as String),
      brandId: Value(json['brand_id'] as String),
      nameFr: Value((json['name'] as Map)['fr'] as String? ?? ''),
      nameEn: Value((json['name'] as Map)['en'] as String?),
      scientificName: Value(json['scientific_name'] as String?),
      form: Value(json['form'] as String?),
      category: Value(json['category'] as String?),
      weightVolume: Value(json['weight_volume'] as String?),
      ingredients: Value(
        json['ingredients'] != null ? jsonEncode(json['ingredients']) : null,
      ),
      certifications: Value(jsonEncode(certNames)),
      certificationsIds: Value(jsonEncode(certsIds)),
      tags: Value(jsonEncode(tagNames)),
      tagsIds: Value(jsonEncode(tagsIds)),
      imageUrl: Value(json['image_url'] as String?),
      galleryUrls: Value(
        json['gallery_urls'] != null ? jsonEncode(json['gallery_urls']) : null,
      ),
      excerptFr: Value((json['excerpt'] as Map?)?['fr'] as String?),
      excerptEn: Value((json['excerpt'] as Map?)?['en'] as String?),
      bienfaitsFr: Value(
        (json['bienfaits'] as Map?)?['fr'] != null
            ? jsonEncode((json['bienfaits'] as Map)['fr'])
            : null,
      ),
      bienfaitsEn: Value(
        (json['bienfaits'] as Map?)?['en'] != null
            ? jsonEncode((json['bienfaits'] as Map)['en'])
            : null,
      ),
      usages: Value(json['usages'] != null ? jsonEncode(json['usages']) : null),
      isActive: Value(json['is_active'] as bool? ?? true),
      createdAt: Value(
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      ),
      updatedAt: Value(
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      ),
    );
  }

  Future<void> toggleArticleFavorite(String articleId) async {
    await _localDb.toggleArticleFavorite(articleId);
  }
}
