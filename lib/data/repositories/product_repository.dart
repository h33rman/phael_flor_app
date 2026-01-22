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
      debugPrint('Brands sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // PRODUCTS
  // ═══════════════════════════════════════════════════════════════

  /// Get all products (offline-first)
  /// Now requires async hydration for tags/certs
  Future<List<models.Product>> getAllProducts() async {
    if (await _connectivity.hasConnection()) {
      await _syncProducts();
    }
    final dbProducts = await _localDb.getAllProducts();
    return _hydrateProducts(dbProducts);
  }

  /// Get products by brand (offline-first)
  Future<List<models.Product>> getProductsByBrand(String brandId) async {
    if (await _connectivity.hasConnection()) {
      await _syncProducts();
    }
    final dbProducts = await _localDb.getProductsByBrand(brandId);
    return _hydrateProducts(dbProducts);
  }

  /// Search products (works offline too!)
  Future<List<models.Product>> searchProducts(String query) async {
    // Sync if online
    if (await _connectivity.hasConnection()) {
      try {
        await _remoteDb.searchProducts(
          query,
        ); // Just to verify connection/warm cache?
        await _syncProducts();
      } catch (e) {
        debugPrint('Search sync error: $e');
      }
    }
    // Perform local search (assuming logic exists in DB or we filter here)
    // AppDatabase currently doesn't have a simple 'searchProducts' returning List<Product>
    // We can reuse getPaginatedProducts with large limit
    final dbProducts = await _localDb.getProductsPaginated(
      limit: 100,
      offset: 0,
      searchQuery: query,
    );
    return _hydrateProducts(dbProducts);
  }

  /// Paginated fetch with filtering
  Future<List<models.Product>> getPaginatedProducts({
    required int limit,
    required int offset,
    String? searchQuery,
    List<String>? brandIds,
    List<String>? forms,
    String? category,
  }) async {
    // 1. Sync if needed (maybe optimized to partial sync later?)
    if (await _connectivity.hasConnection() && offset == 0) {
      await _syncProducts();
    }

    // 2. Query Local DB which handles join-like filtering
    final dbProducts = await _localDb.getProductsPaginated(
      limit: limit,
      offset: offset,
      searchQuery: searchQuery,
      brandIds: brandIds,
      forms: forms,
      category: category,
    );

    // 3. Hydrate with Tags & Certs
    return _hydrateProducts(dbProducts);
  }

  /// Helper to convert List<db.Product> -> List<models.Product>
  /// Fetches Tags and Certs for each product.
  Future<List<models.Product>> _hydrateProducts(
    List<db.Product> dbProducts,
  ) async {
    final List<models.Product> results = [];
    for (final p in dbProducts) {
      // Fetch relations
      final tags = await _localDb.getTagsForProduct(p.id);
      final certs = await _localDb.getCertificationsForProduct(p.id);

      final usages = <models.UsageSection>[];
      if (p.usageFr != null || p.usageEn != null) {
        usages.add(
          models.UsageSection(
            title: {'fr': 'Utilisation', 'en': 'Usage'},
            content: {
              if (p.usageFr != null) 'fr': p.usageFr!,
              if (p.usageEn != null) 'en': p.usageEn!,
            },
            icon: 'lightbulb',
          ),
        );
      }
      /*
      // Dosage Temporarily disabled - missing in Drift Schema

      */

      results.add(
        models.Product(
          id: p.id,
          brandId: p.brandId ?? '',
          name: {'fr': p.nameFr, if (p.nameEn != null) 'en': p.nameEn!},
          scientificName: p.scientificName,
          form: models.ProductForm.fromString(p.formSlug),
          categorySlug: p.categorySlug ?? 'unknown',
          weightVolume: [
            p.weight,
            p.volume,
          ].where((e) => e != null && e.isNotEmpty).join(' / '),
          weight: p.weight,
          volume: p.volume,
          ingredients:
              null, // Ingredients column missing in Drift schema currently
          // ingredients: p.ingredients != null
          //     ? List<String>.from(jsonDecode(p.ingredients!) as List)
          //     : null,
          certifications: certs.map((c) => c.nameFr).toList(),
          imageUrl: p.imageUrl,
          galleryUrls: p.galleryUrls != null
              ? List<String>.from(jsonDecode(p.galleryUrls!) as List)
              : null,
          tags: tags.map((t) => t.nameFr).toList(),
          bienfaits: {
            if (p.benefitsFr != null)
              'fr': [p.benefitsFr!], // stored as text block now
            if (p.benefitsEn != null) 'en': [p.benefitsEn!],
          },
          usages: usages,
          isActive: p.isActive,
          createdAt: p.createdAt,
          updatedAt: p.updatedAt,
          excerpt: {
            if (p.excerptFr != null) 'fr': p.excerptFr!,
            if (p.excerptEn != null) 'en': p.excerptEn!,
          },
        ),
      );
    }
    return results;
  }

  /// Sync products from Supabase to local
  Future<void> _syncProducts() async {
    try {
      // 1. Fetch Entities
      final remoteProducts = await _remoteDb.fetchAllProducts();

      // 2. Fetch Dependencies
      await _syncTags();
      await _syncCertifications();
      await _syncCategories();
      await _syncForms();

      // 3. Insert Products
      final companions = remoteProducts.map((json) {
        // Flatten localized fields if JSON comes as nested objects
        // Using strict key reading based on new Schema
        // Assuming remote JSON keys match DB column names (snake_case)
        // or if using view, they might be nested. Supabase select() returns col names.
        // New Schema cols: name_fr, name_en.
        return db.ProductsCompanion(
          id: Value(json['id'] as String),
          brandId: Value(json['brand_id'] as String),
          categorySlug: Value(json['category_slug'] as String), // FK
          formSlug: Value(json['form_slug'] as String), // FK
          nameFr: Value(json['name_fr'] as String),
          nameEn: Value(json['name_en'] as String?),
          scientificName: Value(json['scientific_name'] as String?),
          weight: Value(json['weight'] as String?),
          volume: Value(json['volume'] as String?),
          // ingredients column removed from Drift schema
          benefitsFr: Value(json['benefits_fr'] as String?),
          benefitsEn: Value(json['benefits_en'] as String?),

          usageFr: Value(json['usage_fr'] as String?),
          usageEn: Value(json['usage_en'] as String?),

          expertNoteFr: Value(json['expert_note_fr'] as String?),
          expertNoteEn: Value(json['expert_note_en'] as String?),

          imageUrl: Value(json['image_url'] as String?),
          galleryUrls: Value(
            json['gallery_urls'] != null
                ? jsonEncode(json['gallery_urls'])
                : null,
          ),

          excerptFr: Value(json['excerpt_fr'] as String?),
          excerptEn: Value(json['excerpt_en'] as String?),

          isNew: Value(json['is_new'] as bool? ?? false),
          isActive: Value(json['is_active'] as bool? ?? true),
          createdAt: Value(
            json['created_at'] != null
                ? DateTime.parse(json['created_at'])
                : null,
          ),
          updatedAt: Value(
            json['updated_at'] != null
                ? DateTime.parse(json['updated_at'])
                : null,
          ),
        );
      }).toList();

      await _localDb.insertProducts(companions);

      // 4. Sync Relations (Join Tables)
      await _syncProductTags();
      await _syncProductCertifications();
    } catch (e) {
      debugPrint('Product sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // DEPENDENCIES SYNC
  // ═══════════════════════════════════════════════════════════════

  Future<void> _syncCategories() async {
    try {
      final remote = await _remoteDb.fetchCategories();
      final companions = remote.map((json) {
        return db.CategoriesCompanion(
          slug: Value(json['slug'] as String),
          nameFr: Value(json['name_fr'] as String),
          nameEn: Value(json['name_en'] as String?),
          color: Value(json['color'] as String?),
          iconUrl: Value(json['icon_url'] as String?),
        );
      }).toList();
      await _localDb.insertCategories(companions);
    } catch (e) {
      debugPrint('Categories sync failed: $e');
    }
  }

  Future<void> _syncForms() async {
    try {
      final remote = await _remoteDb.fetchForms();
      final companions = remote.map((json) {
        return db.FormsCompanion(
          slug: Value(json['slug'] as String),
          nameFr: Value(json['name_fr'] as String),
          nameEn: Value(json['name_en'] as String?),
        );
      }).toList();
      await _localDb.insertForms(companions);
    } catch (e) {
      debugPrint('Forms sync failed: $e');
    }
  }

  Future<void> _syncTags() async {
    try {
      final remote = await _remoteDb.fetchTags();
      final companions = remote.map((json) {
        return db.TagsCompanion(
          id: Value(json['id'] as String),
          nameFr: Value(json['name_fr'] as String),
          nameEn: Value(json['name_en'] as String?),
          iconUrl: Value(json['icon_url'] as String?),
        );
      }).toList();
      await _localDb.insertTags(companions);
    } catch (e) {
      debugPrint('Tags sync failed: $e');
    }
  }

  Future<void> _syncCertifications() async {
    try {
      final remote = await _remoteDb.fetchCertifications();
      final companions = remote.map((json) {
        return db.CertificationsCompanion(
          id: Value(json['id'] as String),
          nameFr: Value(json['name_fr'] as String),
          nameEn: Value(json['name_en'] as String?),
          logoUrl: Value(json['logo_url'] as String?),
        );
      }).toList();
      await _localDb.insertCertifications(companions);
    } catch (e) {
      debugPrint('Certifications sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // JOIN TABLES SYNC
  // ═══════════════════════════════════════════════════════════════

  Future<void> _syncProductTags() async {
    try {
      final remote = await _remoteDb.fetchProductTags();
      final companions = remote.map((json) {
        return db.ProductTagsCompanion(
          productId: Value(json['product_id'] as String),
          tagId: Value(json['tag_id'] as String),
        );
      }).toList();
      await _localDb.insertProductTags(companions);
    } catch (e) {
      debugPrint('ProductTags sync failed: $e');
    }
  }

  Future<void> _syncProductCertifications() async {
    try {
      final remote = await _remoteDb.fetchProductCertifications();
      final companions = remote.map((json) {
        return db.ProductCertificationsCompanion(
          productId: Value(json['product_id'] as String),
          certificationId: Value(json['certification_id'] as String),
        );
      }).toList();
      await _localDb.insertProductCertifications(companions);
    } catch (e) {
      debugPrint('ProductCertifications sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // PUBLIC ACCESSORS FOR LOOKUPS
  // ═══════════════════════════════════════════════════════════════

  Future<List<db.Category>> getAllCategories() async {
    if (await _connectivity.hasConnection()) await _syncCategories();
    return _localDb.getAllCategories(); // Renamed from getCategoryLabels
  }

  Future<List<db.Form>> getAllForms() async {
    if (await _connectivity.hasConnection()) await _syncForms();
    return _localDb.getAllForms();
  }

  Future<List<db.Tag>> getAllTags() async {
    if (await _connectivity.hasConnection()) await _syncTags();
    return _localDb.getAllTags();
  }

  Future<List<db.Certification>> getAllCertifications() async {
    if (await _connectivity.hasConnection()) await _syncCertifications();
    return _localDb.getAllCertifications();
  }

  Future<List<db.Tag>> getTagsForProduct(String productId) {
    return _localDb.getTagsForProduct(productId);
  }

  Future<List<db.Certification>> getCertificationsForProduct(String productId) {
    return _localDb.getCertificationsForProduct(productId);
  }

  // ═══════════════════════════════════════════════════════════════
  // SYNC HELPER
  // ═══════════════════════════════════════════════════════════════

  /// Force sync all data
  Future<void> forceSync() async {
    if (await _connectivity.hasConnection()) {
      await _syncCategories();
      await _syncForms();
      await _syncTags();
      await _syncCertifications();
      await _syncBrands();
      // Products (fetches its own relations)
      await _syncProducts();
      // Articles
      await _syncArticles();
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // ARTICLES (Journal)
  // ═══════════════════════════════════════════════════════════════

  /// Get all articles
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
        return db.ArticlesCompanion(
          id: Value(json['id'] as String),
          categorySlug: Value(json['category_slug'] as String),
          titleFr: Value(json['title_fr'] as String),
          titleEn: Value(json['title_en'] as String?),
          excerptFr: Value(json['excerpt_fr'] as String?),
          excerptEn: Value(json['excerpt_en'] as String?),
          contentFr: Value(json['content_fr'] as String?),
          contentEn: Value(json['content_en'] as String?),
          imageUrl: Value(json['image_url'] as String?),
          readTimeMinutes: Value(
            json['read_time_minutes'] as int?,
          ), // New column in schema
          isActive: Value(json['is_active'] as bool? ?? true),
          publishedAt: Value(
            json['published_at'] != null
                ? DateTime.parse(json['published_at'] as String)
                : null,
          ),
        );
      }).toList();
      await _localDb.insertArticles(companions);
    } catch (e) {
      debugPrint('Article sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // FAVORITES
  // ═══════════════════════════════════════════════════════════════

  Stream<List<String>> watchFavoriteIds() {
    return _localDb.watchFavoriteProductIds();
  }

  Stream<List<String>> watchFavoriteArticleIds() {
    return _localDb.watchFavoriteArticleIds();
  }

  Future<List<String>> getFavoriteIds() {
    return _localDb.getFavoriteIds().then((ids) {
      return ids.whereType<String>().toList();
    });
  }

  Future<void> toggleFavorite(String productId) async {
    // Check if product exists locally
    final product = await _localDb.getProductById(productId);
    if (product == null) {
      // If not, fetch it first (Lazy Load favorite)
      if (await _connectivity.hasConnection()) {
        // We need to fetch this specific product and inserted
        // For now, trigger a simplified sync or fetch single
        // Implement fetchSingleSync if critical.
        // Let's rely on standard sync for now or just allow it to fail logic if loose FK?
        // FK is strict.
        await _syncProducts();
      }
    }
    await _localDb.toggleProductFavorite(productId);
  }

  Future<void> toggleArticleFavorite(String articleId) async {
    await _localDb.toggleArticleFavorite(articleId);
  }
}
