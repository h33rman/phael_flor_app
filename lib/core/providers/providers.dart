import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phael_flor_app/data/sources/local/app_database.dart' as db;
import 'package:phael_flor_app/data/sources/remote/supabase_client.dart';
import 'package:phael_flor_app/data/repositories/product_repository.dart';
import 'package:phael_flor_app/core/utils/connectivity_helper.dart';

// ═══════════════════════════════════════════════════════════════
// DATABASE PROVIDERS
// ═══════════════════════════════════════════════════════════════

/// Local database instance
final appDatabaseProvider = Provider<db.AppDatabase>((ref) {
  return db.AppDatabase();
});

/// Remote Supabase data source
final supabaseDataSourceProvider = Provider<SupabaseDataSource>((ref) {
  return SupabaseDataSource();
});

/// Connectivity helper
final connectivityProvider = Provider<ConnectivityHelper>((ref) {
  return ConnectivityHelper();
});

// ═══════════════════════════════════════════════════════════════
// REPOSITORY PROVIDERS
// ═══════════════════════════════════════════════════════════════

/// Product repository (offline-first)
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(
    localDb: ref.read(appDatabaseProvider),
    remoteDb: ref.read(supabaseDataSourceProvider),
    connectivity: ref.read(connectivityProvider),
  );
});

// ═══════════════════════════════════════════════════════════════
// DATA PROVIDERS (for UI)
// ═══════════════════════════════════════════════════════════════

/// All brands (returns Drift Brand objects)
final brandsProvider = FutureProvider<List<db.Brand>>((ref) async {
  final repo = ref.read(productRepositoryProvider);
  return repo.getAllBrands();
});

/// All products (returns Drift Product objects)
final productsProvider = FutureProvider<List<db.Product>>((ref) async {
  final repo = ref.read(productRepositoryProvider);
  return repo.getAllProducts();
});

/// Products filtered by brand
final productsByBrandProvider = FutureProvider.family<List<db.Product>, String>(
  (ref, brandId) async {
    final repo = ref.read(productRepositoryProvider);
    return repo.getProductsByBrand(brandId);
  },
);

/// Product search
final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider = FutureProvider<List<db.Product>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  final repo = ref.read(productRepositoryProvider);
  return repo.searchProducts(query);
});

/// Connectivity status
final isOnlineProvider = StreamProvider<bool>((ref) {
  return ref.read(connectivityProvider).onConnectivityChanged;
});
