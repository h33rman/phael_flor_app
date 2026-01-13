import 'dart:convert';
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
            ),
          )
          .toList();
      await _localDb.insertBrands(companions);
    } catch (e) {
      // Silently fail - will use cached data
      print('Brand sync failed: $e');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // PRODUCTS
  // ═══════════════════════════════════════════════════════════════

  /// Get all products (offline-first) - returns Drift Product objects
  Future<List<db.Product>> getAllProducts() async {
    if (await _connectivity.hasConnection()) {
      await _syncProducts();
    }
    return _localDb.getAllProducts();
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
        print('Remote search failed, using local: $e');
      }
    }
    // Fall back to local search
    return _localDb.searchProducts(query);
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
      final companions = remoteProducts
          .map(
            (json) => db.ProductsCompanion(
              id: Value(json['id'] as String),
              brandId: Value(json['brand_id'] as String),
              nameFr: Value((json['name'] as Map)['fr'] as String? ?? ''),
              nameEn: Value((json['name'] as Map)['en'] as String?),
              scientificName: Value(json['scientific_name'] as String?),
              form: Value(json['form'] as String?),
              category: Value(json['category'] as String?),
              weightVolume: Value(json['weight_volume'] as String?),
              ingredients: Value(
                json['ingredients'] != null
                    ? jsonEncode(json['ingredients'])
                    : null,
              ),
              certifications: Value(
                json['certifications'] != null
                    ? jsonEncode(json['certifications'])
                    : null,
              ),
              imageUrl: Value(json['image_url'] as String?),
              galleryUrls: Value(
                json['gallery_urls'] != null
                    ? jsonEncode(json['gallery_urls'])
                    : null,
              ),
              tags: Value(
                json['tags'] != null ? jsonEncode(json['tags']) : null,
              ),
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
              usages: Value(
                json['usages'] != null ? jsonEncode(json['usages']) : null,
              ),
              isActive: Value(json['is_active'] as bool? ?? true),
              createdAt: Value(
                json['created_at'] != null
                    ? DateTime.parse(json['created_at'] as String)
                    : null,
              ),
              updatedAt: Value(
                json['updated_at'] != null
                    ? DateTime.parse(json['updated_at'] as String)
                    : null,
              ),
            ),
          )
          .toList();
      await _localDb.insertProducts(companions);
    } catch (e) {
      print('Product sync failed: $e');
    }
  }

  /// Force sync all data
  Future<void> forceSync() async {
    if (await _connectivity.hasConnection()) {
      await _syncBrands();
      await _syncProducts();
    }
  }
}
