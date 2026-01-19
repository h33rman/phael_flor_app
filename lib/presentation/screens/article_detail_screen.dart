import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/providers/providers.dart';
import '../../data/models/article.dart';

class ArticleDetailScreen extends ConsumerWidget {
  final String articleId;

  const ArticleDetailScreen({super.key, required this.articleId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleAsync = ref.watch(articleByIdProvider(articleId));
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: articleAsync.when(
        data: (article) {
          if (article == null) {
            return Center(child: Text('error.article_not_found'.tr()));
          }
          return _ArticleContent(article: article);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _ArticleContent extends ConsumerWidget {
  final Article article;

  const _ArticleContent({required this.article});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final favoriteIdsAsync = ref.watch(favoriteArticleIdsProvider);
    final isFavorite = favoriteIdsAsync.value?.contains(article.id) ?? false;

    return CustomScrollView(
      slivers: [
        // App Bar with Image
        SliverAppBar.large(
          expandedHeight: 300,
          leading: IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              child: const Icon(LucideIcons.arrowLeft, color: Colors.white),
            ),
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                child: Icon(
                  isFavorite ? LucideIcons.heart : LucideIcons.heart,
                  color: isFavorite ? Colors.red : Colors.white,
                  fill: isFavorite ? 1.0 : 0.0, // Fill if favorite
                ),
              ),
              onPressed: () {
                ref.read(articleRepositoryProvider).toggleFavorite(article.id);
              },
            ),
            const SizedBox(width: 8),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (article.featureImageUrl != null)
                  CachedNetworkImage(
                    imageUrl: article.featureImageUrl!,
                    fit: BoxFit.cover,
                  ),
                // Gradient for text readability
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3), // Top shade
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7), // Bottom shade
                      ],
                    ),
                  ),
                ),
              ],
            ),
            titlePadding: const EdgeInsets.all(16),
            title: Text(
              article.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16, // collapsed size
                shadows: [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Content Body
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Metadata Row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        article.category.toUpperCase(),
                        style: TextStyle(
                          color: colorScheme.onPrimaryContainer,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (article.publishedAt != null)
                      Text(
                        DateFormat.yMMMd().format(article.publishedAt!),
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 24),

                // Markdown Content
                if (article.content != null)
                  MarkdownBody(
                    data: article.content!,
                    styleSheet: MarkdownStyleSheet(
                      h1: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                      h2: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                      h3: TextStyle(
                        color: colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                      p: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.8),
                        fontSize: 16,
                        height: 1.6,
                      ),
                      listBullet: TextStyle(color: colorScheme.primary),
                      blockquote: TextStyle(
                        color: colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                      blockquoteDecoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        border: Border(
                          left: BorderSide(
                            color: colorScheme.primary,
                            width: 4,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
