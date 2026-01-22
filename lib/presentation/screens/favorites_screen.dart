import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/providers/providers.dart';

import '../components/components.dart';

/// Favorites screen with tabs for Products and Articles
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(
            'favorites.title'.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          bottom: TabBar(
            tabs: [
              Tab(text: 'favorites.products'.tr()),
              Tab(text: 'favorites.journal'.tr()),
            ],
            indicatorColor: colorScheme.primary,
            labelColor: colorScheme.primary,
            unselectedLabelColor: colorScheme.onSurfaceVariant,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
          ),
        ),
        body: const TabBarView(
          children: [_FavoriteProductsTab(), _FavoriteArticlesTab()],
        ),
      ),
    );
  }
}

class _FavoriteProductsTab extends ConsumerWidget {
  const _FavoriteProductsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteProductsProvider);
    final brandsAsync = ref.watch(brandsProvider);

    // Create a map of brand ID to brand name for quick lookup
    final brandMap = brandsAsync.maybeWhen(
      data: (brands) => {for (var b in brands) b.id: b.name},
      orElse: () => <String, String>{},
    );

    return favoritesAsync.when(
      data: (favorites) {
        if (favorites.isEmpty) {
          return FloralEmptyState(
            subtitle: "No favorite products yet\nStart exploring!",
            onPressed: () {
              ref.read(navIndexProvider.notifier).state = 0; // Home
              context.go('/home');
            },
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final product = favorites[index];
            return FavoriteProductCard(
              product: product,
              brandName: brandMap[product.brandId],
              onTap: () => context.push('/product/${product.id}'),
              onRemove: () {
                ref.read(productRepositoryProvider).toggleFavorite(product.id);
              },
            );
          },
        );
      },
      loading: () => const Center(child: NatureLoader()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

class _FavoriteArticlesTab extends ConsumerWidget {
  const _FavoriteArticlesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteArticlesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return favoritesAsync.when(
      data: (favorites) {
        if (favorites.isEmpty) {
          return FloralEmptyState(
            subtitle: "No saved articles yet\nRead our journal!",
            buttonText: "Go to Journal",
            onPressed: () {
              // Navigate to Journal Tab (Index 1)
              ref.read(navIndexProvider.notifier).state = 1;
              context.go('/home');
            },
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final article = favorites[index];
            // Reuse TipListTile-like structure or create a simple card
            // We'll create a simple variation here inline or reuse if accessible.
            // _TipListTile is private in TipsScreen. Let's make a simple card here.

            return Dismissible(
              key: ValueKey(article.id),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                ref.read(articleRepositoryProvider).toggleFavorite(article.id);
              },
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 24),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  LucideIcons.trash2,
                  color: colorScheme.onErrorContainer,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => context.push('/article/${article.id}'),
                    child: Row(
                      children: [
                        // Image
                        if (article.featureImageUrl != null)
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CachedNetworkImage(
                              imageUrl: article.featureImageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),

                        // Content
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.category.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  article.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}
