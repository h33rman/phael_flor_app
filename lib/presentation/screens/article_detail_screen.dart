import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/providers.dart';
import '../../data/models/article.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../components/favorite_product_card.dart'; // Reuse for horizontal listing?
// Actually, let's use a simpler vertical list item or reuse FavoriteProductCard since it's nice.

class ArticleDetailScreen extends ConsumerWidget {
  final String articleId;

  const ArticleDetailScreen({super.key, required this.articleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleAsync = ref.watch(articleByIdProvider(articleId));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: articleAsync.when(
        data: (article) {
          if (article == null) {
            return const Center(child: Text('Article not found'));
          }
          return _ArticleContent(article: article);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _ArticleContent extends StatelessWidget {
  final Article article;

  const _ArticleContent({required this.article});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        // App Bar with Hero Image
        SliverAppBar.large(
          expandedHeight: 300,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            onPressed: () => context.pop(),
            style: IconButton.styleFrom(
              backgroundColor: colorScheme.surface.withValues(alpha: 0.8),
              shape: const CircleBorder(),
            ),
          ),
          actions: [
            _ArticleFavoriteButton(articleId: article.id),
            const SizedBox(width: 8),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: article.featureImageUrl != null
                ? CachedNetworkImage(
                    imageUrl: article.featureImageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (_, __) =>
                        Container(color: colorScheme.surfaceContainerHighest),
                  )
                : Container(color: colorScheme.primaryContainer),
          ),
        ),

        // Content Body
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Metadata
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      article.category.toUpperCase(),
                      style: TextStyle(
                        color: colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Title
              Text(
                article.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  height: 1.2,
                ),
              ).animate().fadeIn().slideY(begin: 0.2, end: 0),

              const SizedBox(height: 24),

              // Divider
              Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
              const SizedBox(height: 24),

              // Content Renderer (Simple Manual Parser)
              _SimpleHtmlRenderer(htmlContent: article.content ?? ''),

              const SizedBox(height: 48),

              // Shop the Story Section
              if (article.relatedProductIds.isNotEmpty) ...[
                Text(
                  'Shop the Story', // Localization key: 'journal.shop_story'
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _RelatedProductsList(productIds: article.relatedProductIds),
              ],

              const SizedBox(height: 40),
            ]),
          ),
        ),
      ],
    );
  }
}

/// Simple HTML Renderer to handle basic tags used in seed data
class _SimpleHtmlRenderer extends StatelessWidget {
  final String htmlContent;

  const _SimpleHtmlRenderer({required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    // Split by tags to find blocks
    // This is VERY basic, strict for the <p>, <h3>, <ul><li> structure we established.
    // In a real app we'd use flutter_widget_from_html

    // We will just strip tags and use basic styling for now to avoid package issues,
    // OR we can do a simple replace.
    // Let's iterate line by line if possible or block by block.

    // Fallback: Strip HTML
    // final text = htmlContent.replaceAll(RegExp(r'<[^>]*>'), '');

    // Better: split by newlines or blocks
    // Let's stick to stripping for MVP safely.
    // Actually, I'll do a primitive render.

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hacky way to render specific tags:
        ...htmlContent.split(RegExp(r'(?=<(h3|p|ul)>)')).map((block) {
          final cleanBlock = block.replaceAll(RegExp(r'<[^>]*>'), '').trim();
          if (cleanBlock.isEmpty) return const SizedBox.shrink();

          if (block.startsWith('<h3>')) {
            return Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              child: Text(
                cleanBlock,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22, // Increased from 18
                  height: 1.3,
                  color: Colors.black87,
                ),
              ),
            );
          } else if (block.startsWith('<ul>')) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                '• $cleanBlock',
                style: const TextStyle(
                  height: 1.8,
                  fontSize: 18, // Increased from default/16
                  color: Colors.black87,
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                cleanBlock,
                style: const TextStyle(
                  height: 1.8, // Increased line height for readability
                  fontSize: 18, // Increased from 16
                  color: Colors.black87,
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}

class _RelatedProductsList extends ConsumerWidget {
  final List<String> productIds;

  const _RelatedProductsList({required this.productIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProductsAsync = ref.watch(productsProvider);

    return allProductsAsync.when(
      data: (products) {
        final related = products
            .where((p) => productIds.contains(p.id))
            .toList();
        if (related.isEmpty) return const SizedBox.shrink();

        return Column(
          children: related.map((product) {
            // Using FavoriteProductCard as a list item because it looks good horizontally
            return FavoriteProductCard(
              product: product,
              brandName: 'Phael Flor', // hardcoded or fetched if available
              onTap: () => context.push('/product/${product.id}'),
              // No remove button needed here
            );
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _ArticleFavoriteButton extends ConsumerWidget {
  final String articleId;

  const _ArticleFavoriteButton({super.key, required this.articleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch article favorites
    final favoriteIdsAsync = ref.watch(favoriteArticleIdsProvider);

    return favoriteIdsAsync.when(
      data: (ids) {
        final isFavorite = ids.contains(articleId);

        return IconButton(
          onPressed: () {
            // Use ArticleRepository
            ref.read(articleRepositoryProvider).toggleFavorite(articleId);
          },
          icon: Icon(
            isFavorite ? LucideIcons.heart : LucideIcons.heart,
            color: isFavorite ? Colors.red : Colors.white,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            shape: const CircleBorder(),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
