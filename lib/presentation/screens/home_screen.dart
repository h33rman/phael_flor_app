import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/category_colors.dart';
import '../../core/providers/providers.dart';
import '../components/components.dart';

/// Home screen with modern design inspired by plant apps
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String? _selectedCategory;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final productsAsync = ref.watch(productsProvider);
    final brandsAsync = ref.watch(brandsProvider);
    final isOnlineAsync = ref.watch(isOnlineProvider);

    // Create a map of brand ID to brand name for quick lookup
    final brandMap = brandsAsync.maybeWhen(
      data: (brands) => {for (var b in brands) b.id: b.name},
      orElse: () => <String, String>{},
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: CustomScrollView(
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
            SliverToBoxAdapter(
              child: _buildCategoriesSection(context, colorScheme),
            ),

            // Popular Products Section
            SliverToBoxAdapter(
              child: _buildSectionHeader(
                context,
                'Produits populaires',
                colorScheme,
              ),
            ),

            // Products Grid
            productsAsync.when(
              data: (products) {
                var filtered = products;
                if (_selectedCategory != null) {
                  filtered = filtered
                      .where((p) => p.category == _selectedCategory)
                      .toList();
                }

                if (filtered.isEmpty) {
                  return SliverFillRemaining(child: EmptyState.noResults());
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.68,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = filtered[index];
                      return ProductCard(
                        product: product,
                        brandName: brandMap[product.brandId],
                        onTap: () => Navigator.of(
                          context,
                        ).pushNamed('/product/${product.id}'),
                        onFavoriteToggle: () {
                          // TODO: Toggle favorite
                        },
                      );
                    }, childCount: filtered.length),
                  ),
                );
              },
              loading: () => const SliverLoadingShimmer(),
              error: (e, _) =>
                  SliverFillRemaining(child: Center(child: Text('Erreur: $e'))),
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
                      'Bonjour! 👋',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Découvrez nos produits naturels',
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
              // Notification icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.bell,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
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
              decoration: InputDecoration(
                hintText: 'Rechercher des produits...',
                hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                prefixIcon: Icon(
                  LucideIcons.search,
                  color: colorScheme.onSurfaceVariant,
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    LucideIcons.slidersHorizontal,
                    size: 18,
                    color: colorScheme.onPrimary,
                  ),
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
                  'Bien-être naturel 🌿',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Découvrez notre sélection de produits bio pour votre santé.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.tonal(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.onPrimary,
                    foregroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Explorer'),
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

  Widget _buildCategoriesSection(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    final categories = [
      _CategoryItem(
        key: null,
        label: 'Tous',
        icon: LucideIcons.layoutGrid,
        color: colorScheme.primary,
      ),
      _CategoryItem(
        key: 'spice',
        label: 'Épices',
        icon: LucideIcons.flame,
        color: CategoryColors.spice,
      ),
      _CategoryItem(
        key: 'essential_oil',
        label: 'Huiles',
        icon: LucideIcons.droplets,
        color: CategoryColors.essentialOil,
      ),
      _CategoryItem(
        key: 'herb',
        label: 'Herbes',
        icon: LucideIcons.leaf,
        color: CategoryColors.herb,
      ),
      _CategoryItem(
        key: 'body_care',
        label: 'Soins',
        icon: LucideIcons.sparkles,
        color: CategoryColors.bodyCare,
      ),
      _CategoryItem(
        key: 'infusion',
        label: 'Infusions',
        icon: LucideIcons.coffee,
        color: CategoryColors.infusion,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Catégories', colorScheme),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = _selectedCategory == cat.key;

              return GestureDetector(
                onTap: () => setState(() => _selectedCategory = cat.key),
                child: Container(
                  width: 72,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? cat.color
                              : cat.color.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: cat.color, width: 3)
                              : null,
                        ),
                        child: Icon(
                          cat.icon,
                          size: 24,
                          color: isSelected ? Colors.white : cat.color,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cat.label,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isSelected
                              ? cat.color
                              : colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
              'Voir tout',
              style: TextStyle(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem {
  final String? key;
  final String label;
  final IconData icon;
  final Color color;

  _CategoryItem({
    required this.key,
    required this.label,
    required this.icon,
    required this.color,
  });
}
