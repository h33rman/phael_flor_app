import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phael_flor_app/data/sources/local/app_database.dart' as db;
import 'package:phael_flor_app/data/sources/remote/supabase_client.dart';
import 'package:phael_flor_app/data/repositories/product_repository.dart';
import 'package:phael_flor_app/data/repositories/article_repository.dart';
import 'package:phael_flor_app/core/utils/connectivity_helper.dart';
import 'package:phael_flor_app/data/models/enums.dart';
import 'package:phael_flor_app/data/models/article.dart' as model;

// ═══════════════════════════════════════════════════════════════
// FILTER STATE
// ═══════════════════════════════════════════════════════════════

class ProductFilter {
  final Set<String> brandIds;
  final Set<ProductForm> forms;
  final String? category;

  const ProductFilter({
    this.brandIds = const {},
    this.forms = const {},
    this.category,
  });

  ProductFilter copyWith({
    Set<String>? brandIds,
    Set<ProductForm>? forms,
    String? category,
  }) {
    return ProductFilter(
      brandIds: brandIds ?? this.brandIds,
      forms: forms ?? this.forms,
      category: category ?? this.category,
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// DATABASE PROVIDERS
// ═══════════════════════════════════════════════════════════════

/// Main navigation index provider
final navIndexProvider = StateProvider<int>((ref) => 0);

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

/// Article repository
final articleRepositoryProvider = Provider<ArticleRepository>((ref) {
  return ArticleRepository(localDb: ref.read(appDatabaseProvider));
});

/// All articles
final articlesProvider = FutureProvider<List<model.Article>>((ref) async {
  final repo = ref.read(articleRepositoryProvider);
  await repo.syncArticles(); // Sync from cloud
  return repo.getAllArticles();
});

/// Article by ID
final articleByIdProvider = FutureProvider.family<model.Article?, String>((
  ref,
  id,
) async {
  final repo = ref.read(articleRepositoryProvider);
  return repo.getArticleById(id);
});

/// All brandss (returns Drift Brand objects)
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

/// Active filters
final activeFilterProvider = StateProvider<ProductFilter>(
  (ref) => const ProductFilter(),
);

/// Category selection (formerly local state)
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

/// State for pagination
class PaginatedState {
  final List<db.Product> products;
  final bool isLoading;
  final bool hasMore;
  final int page;

  const PaginatedState({
    required this.products,
    required this.isLoading,
    required this.hasMore,
    required this.page,
  });

  factory PaginatedState.initial() {
    return const PaginatedState(
      products: [],
      isLoading: false,
      hasMore: true,
      page: 0,
    );
  }

  PaginatedState copyWith({
    List<db.Product>? products,
    bool? isLoading,
    bool? hasMore,
    int? page,
  }) {
    return PaginatedState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }
}

/// Pagination Notifier
class PaginatedProductsNotifier extends StateNotifier<PaginatedState> {
  final Ref ref;
  static const int _limit = 10;

  PaginatedProductsNotifier(this.ref) : super(PaginatedState.initial()) {
    // Listen to filter changes to reset list
    ref.listen(searchQueryProvider, (_, __) => refresh());
    ref.listen(activeFilterProvider, (_, __) => refresh());
    ref.listen(selectedCategoryProvider, (_, __) => refresh());

    // Initial fetch
    loadMore();
  }

  Future<void> refresh() async {
    state = PaginatedState.initial();
    await loadMore();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true);

    try {
      final repo = ref.read(productRepositoryProvider);
      final query = ref.read(searchQueryProvider);
      final filter = ref.read(activeFilterProvider);
      final category = ref.read(selectedCategoryProvider);

      // Convert Enums to Strings for DB
      final formStrings = filter.forms
          .map((e) => e.toString().split('.').last)
          .toList();

      final newProducts = await repo.getPaginatedProducts(
        limit: _limit,
        offset: state.page * _limit,
        searchQuery: query,
        brandIds: filter.brandIds.toList(),
        forms: formStrings,
        category: category ?? filter.category,
      );

      state = state.copyWith(
        products: [...state.products, ...newProducts],
        isLoading: false,
        hasMore: newProducts.length >= _limit,
        page: state.page + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      // Handle error gracefully (maybe show snackbar in UI via listener)
      print('Pagination error: $e');
    }
  }
}

/// Filtered products provider (now paginated)
final filteredProductsProvider =
    StateNotifierProvider<PaginatedProductsNotifier, PaginatedState>((ref) {
      return PaginatedProductsNotifier(ref);
    });

/// Connectivity status
final isOnlineProvider = StreamProvider<bool>((ref) {
  return ref.read(connectivityProvider).onConnectivityChanged;
});

// ═══════════════════════════════════════════════════════════════
// FAVORITES PROVIDERS
// ═══════════════════════════════════════════════════════════════

/// Favorite Product IDs (Live Stream)
final favoriteIdsProvider = StreamProvider<List<String>>((ref) {
  final repo = ref.read(productRepositoryProvider);
  return repo.watchFavoriteIds();
});

/// Favorite Article IDs (Live Stream)
final favoriteArticleIdsProvider = StreamProvider<List<String>>((ref) {
  final repo = ref.read(articleRepositoryProvider);
  return repo.watchFavoriteIds();
});

/// Favorite Products (Resolved Objects)
final favoriteProductsProvider = FutureProvider<List<db.Product>>((ref) async {
  final favoriteIds = await ref.watch(favoriteIdsProvider.future);
  if (favoriteIds.isEmpty) return [];

  final allProducts = await ref.watch(productsProvider.future);
  return allProducts.where((p) => favoriteIds.contains(p.id)).toList();
});
