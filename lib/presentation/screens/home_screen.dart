import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/providers/providers.dart';
import '../components/components.dart';

/// Home screen with modern design inspired by plant apps
class HomeScreen extends ConsumerStatefulWidget {
  final ScrollController? scrollController;

  const HomeScreen({super.key, this.scrollController});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add scroll listener for pagination
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    if (widget.scrollController != null) {
      widget.scrollController!.removeListener(_onScroll);
    }
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (widget.scrollController != null) {
      final maxScroll = widget.scrollController!.position.maxScrollExtent;
      final currentScroll = widget.scrollController!.offset;
      // Load more when scrolled to 90% of the content
      if (currentScroll >= (maxScroll * 0.9)) {
        ref.read(filteredProductsProvider.notifier).loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Use the paginated provider
    final paginatedState = ref.watch(filteredProductsProvider);
    final products = paginatedState.products;
    final isLoading = paginatedState.isLoading;
    final brandsAsync = ref.watch(brandsProvider);
    final isOnlineAsync = ref.watch(isOnlineProvider);
    final favoriteIdsAsync = ref.watch(favoriteIdsProvider);
    final favoriteIds = favoriteIdsAsync.asData?.value ?? [];

    // Create a map of brand ID to brand name for quick lookup
    final brandMap = brandsAsync.maybeWhen(
      data: (brands) => {for (var b in brands) b.id: b.name},
      orElse: () => <String, String>{},
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            // Header with search
            SliverToBoxAdapter(
              child: _buildHeader(context, colorScheme, isOnlineAsync),
            ),

            // Featured Banner
            SliverToBoxAdapter(
              child: _buildFeaturedBanner(context, colorScheme),
            ),

            // Categories Section
            const SliverToBoxAdapter(child: CategorySelector()),

            // Popular Products Section
            SliverToBoxAdapter(
              child: _buildSectionHeader(
                context,
                'home.popular'.tr(),
                colorScheme,
              ),
            ),

            // Products Grid State Handling
            if (products.isEmpty && isLoading)
              // Initial Loading
              const SliverFillRemaining(child: NatureLoader())
            else if (products.isEmpty && !isLoading)
              // No Results
              SliverFillRemaining(child: EmptyState.noResults())
            else
              // Product List
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = products[index];
                    final isFavorite = favoriteIds.contains(product.id);
                    return ProductCard(
                      product: product,
                      brandName: brandMap[product.brandId],
                      isFavorite: isFavorite,
                      onTap: () => context.push('/product/${product.id}'),
                      onFavoriteToggle: () {
                        ref
                            .read(productRepositoryProvider)
                            .toggleFavorite(product.id);
                      },
                    );
                  }, childCount: products.length),
                ),
              ),

            // Bottom Loading Indicator (for pagination)
            if (products.isNotEmpty && isLoading)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ColorScheme colorScheme,
    AsyncValue<bool> isOnlineAsync,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with greeting and icons
          Row(
            children: [
              // Profile avatar
              CircleAvatar(
                radius: 22,
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(
                  LucideIcons.user,
                  size: 22,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 12),
              // Greeting
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'home.greeting'.tr(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'home.subtitle'.tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Offline indicator
              isOnlineAsync.when(
                data: (isOnline) => isOnline
                    ? const SizedBox.shrink()
                    : Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.errorContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LucideIcons.wifiOff,
                          size: 18,
                          color: colorScheme.onErrorContainer,
                        ),
                      ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const SizedBox(width: 8),
              // Favorites icon
              InkWell(
                onTap: () => context.push('/favorites'),
                customBorder: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LucideIcons.heart,
                    size: 20,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Search bar
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                // Update search query provider
                ref.read(searchQueryProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: 'home.search_hint'.tr(),
                hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                prefixIcon: Icon(
                  LucideIcons.search,
                  color: colorScheme.onSurfaceVariant,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_searchController.text.isNotEmpty)
                      IconButton(
                        icon: Icon(
                          LucideIcons.x,
                          size: 18,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(searchQueryProvider.notifier).state = '';
                        },
                      ),

                    Builder(
                      builder: (context) {
                        final hasActiveFilters =
                            ref
                                .watch(activeFilterProvider)
                                .brandIds
                                .isNotEmpty ||
                            ref.watch(activeFilterProvider).forms.isNotEmpty;

                        return IconButton(
                          icon: Icon(
                            // Change icon to funnel when active to show "filtered" state
                            hasActiveFilters
                                ? LucideIcons.filter
                                : LucideIcons.slidersHorizontal,
                            size: 20,
                            color: hasActiveFilters
                                ? colorScheme.primary
                                : colorScheme.onSurfaceVariant,
                          ),
                          onPressed: () {
                            // Open Filter Modal
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: colorScheme.surface,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => const FilterModal(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBanner(BuildContext context, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'home.banner_title'.tr(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'home.banner_subtitle'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: () {
                    // Navigate to Tips tab (Index 1)
                    ref.read(navIndexProvider.notifier).state = 1;
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.onPrimary,
                    foregroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('home.banner_button'.tr()),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Decorative leaf icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.onPrimary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.leaf,
              size: 40,
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    ColorScheme colorScheme,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'home.view_all'.tr(),
              style: TextStyle(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
