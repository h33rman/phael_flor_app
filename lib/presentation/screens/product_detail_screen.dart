import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../core/utils/color_utils.dart';
import '../../core/providers/providers.dart';
import '../../data/models/models.dart' as models;

import '../components/components.dart';

/// Product detail screen with 3 tabs
class ProductDetailScreen extends ConsumerWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return productsAsync.when(
      data: (products) {
        final product = products.firstWhere(
          (p) => p.id == productId,
          orElse: () => throw Exception('Product not found'),
        );
        return _ProductDetailBody(product: product);
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, _) => Scaffold(body: Center(child: Text('Error: $error'))),
    );
  }
}

class _ProductDetailBody extends ConsumerStatefulWidget {
  final models.Product product;

  const _ProductDetailBody({required this.product});

  @override
  ConsumerState<_ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends ConsumerState<_ProductDetailBody> {
  int _currentImageIndex = 0;

  String _getProductName(BuildContext context) {
    final locale = context.locale.languageCode;
    return widget.product.name[locale] ??
        widget.product.name['en'] ??
        widget.product.name['fr'] ??
        '';
  }

  String? _getExcerpt(BuildContext context) {
    final locale = context.locale.languageCode;
    return widget.product.excerpt?[locale] ??
        widget.product.excerpt?['en'] ??
        widget.product.excerpt?['fr'];
  }

  String? _getExpertNote(BuildContext context) {
    // Expert note logic if reintroduced in model
    return null;
  }

  List<String> _getGalleryUrls() {
    return widget.product.galleryUrls ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final favoriteIdsAsync = ref.watch(favoriteIdsProvider);
    final isFavorite =
        favoriteIdsAsync.asData?.value.contains(widget.product.id) ?? false;

    final dynamicColors = ref.watch(categoryColorsProvider).asData?.value;
    final categorySlug = widget.product.categorySlug;
    final categoryColor =
        dynamicColors?[categorySlug] ??
        ColorUtils.parseHex(null, fallback: colorScheme.primary);

    final primaryColor = categoryColor;
    final containerColor = categoryColor.withValues(alpha: 0.2);

    final gallery = _getGalleryUrls();
    final images = gallery.isNotEmpty
        ? gallery
        : (widget.product.imageUrl != null ? [widget.product.imageUrl!] : []);

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 320,
              pinned: true,
              backgroundColor: containerColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (images.isNotEmpty)
                      PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: images[index],
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) => Container(
                              color: containerColor.withValues(alpha: 0.3),
                            ),
                          );
                        },
                      )
                    else
                      Container(color: containerColor.withValues(alpha: 0.3)),

                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.3),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.6),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),

                    // Page Indicators
                    if (images.length > 1)
                      Positioned(
                        bottom: 32,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: images.asMap().entries.map((entry) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentImageIndex == entry.key
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 24,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: colorScheme.surface.withValues(alpha: 0.8),
                  child: IconButton(
                    icon: const Icon(LucideIcons.arrowLeft, size: 20),
                    color: colorScheme.onSurface,
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
              actions: [
                CircleAvatar(
                  backgroundColor: isFavorite
                      ? colorScheme.primaryContainer
                      : colorScheme.surface.withValues(alpha: 0.8),
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : LucideIcons.heart,
                      size: 20,
                      color: isFavorite
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                    ),
                    onPressed: () {
                      ref
                          .read(productRepositoryProvider)
                          .toggleFavorite(widget.product.id);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: colorScheme.surface.withValues(alpha: 0.8),
                  child: IconButton(
                    icon: const Icon(LucideIcons.share2, size: 20),
                    color: colorScheme.onSurface,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Share functionality coming soon!'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.product.categorySlug.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: containerColor.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'categories.$categorySlug'.tr(),
                          style: TextStyle(
                            color: colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Text(
                      _getProductName(context),
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    if (_getExcerpt(context) != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _getExcerpt(context)!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ],
                    if (widget.product.scientificName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        widget.product.scientificName!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (widget.product.weightVolume != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            LucideIcons.scale,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.product.weightVolume!,
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (_getExpertNote(context) != null) ...[
                      const SizedBox(height: 16),
                      _ExpertNoteCard(
                        note: _getExpertNote(context)!,
                        color: categoryColor,
                      ),
                    ],
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  labelColor: primaryColor,
                  unselectedLabelColor: colorScheme.onSurfaceVariant,
                  indicatorColor: primaryColor,
                  tabs: [
                    Tab(text: 'product.tabs.characteristics'.tr()),
                    Tab(text: 'product.tabs.about'.tr()),
                    Tab(text: 'product.tabs.usage'.tr()),
                  ],
                ),
                colorScheme.surface,
              ),
            ),
          ],
          body: TabBarView(
            children: [
              _CharacteristicsTab(
                product: widget.product,
                categoryColor: primaryColor,
              ),
              _AboutTab(product: widget.product),
              _UsageTab(product: widget.product, categoryColor: primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color bg;
  _TabBarDelegate(this.tabBar, this.bg);
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  Widget build(context, shrinkOffset, overlapsContent) =>
      Container(color: bg, child: tabBar);
  @override
  bool shouldRebuild(covariant _TabBarDelegate old) => false;
}

class _CharacteristicsTab extends ConsumerWidget {
  final models.Product product;
  final Color categoryColor;
  const _CharacteristicsTab({
    required this.product,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final ingredients = product.ingredients ?? [];

    // Fetch certifications for this product
    final certsAsync = ref.watch(productCertificationsProvider(product.id));
    final certs = certsAsync.asData?.value ?? [];

    if (ingredients.isEmpty && certs.isEmpty && product.form == null) {
      return EmptyState.noData();
    }

    final locale = context.locale.languageCode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (product.form != null) ...[
          _InfoCard(
            icon: LucideIcons.box,
            title: 'product.tabs.characteristics'.tr(),
            content: product.form.toString().split('.').last, // Enum to String
          ),
          const SizedBox(height: 16),
        ],
        if (ingredients.isNotEmpty) ...[
          Text(
            'product.ingredients'.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...ingredients.map(
            (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    LucideIcons.checkCircle2,
                    size: 18,
                    color: categoryColor,
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text(i)),
                ],
              ),
            ),
          ),
        ],
        if (certs.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text(
            'product.certifications'.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: certs.map((c) {
              final name = locale == 'en' && c.nameEn != null
                  ? c.nameEn!
                  : c.nameFr;

              if (c.logoUrl != null && c.logoUrl!.isNotEmpty) {
                return Tooltip(
                  message: name,
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: colorScheme.outlineVariant),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: c.logoUrl!,
                      fit: BoxFit.contain,
                      errorWidget: (_, __, ___) => Center(
                        child: Text(
                          name[0],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }
}

class _AboutTab extends ConsumerWidget {
  final models.Product product;
  const _AboutTab({required this.product});

  List<String> _getBienfaits(BuildContext context) {
    final locale = context.locale.languageCode;
    return product.bienfaits?[locale] ?? product.bienfaits?['en'] ?? [];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final bienfaits = _getBienfaits(context);

    // Fetch Tags
    final tagsAsync = ref.watch(productTagsProvider(product.id));
    final tags = tagsAsync.asData?.value ?? [];

    if (bienfaits.isEmpty && tags.isEmpty) return EmptyState.noData();

    final locale = context.locale.languageCode;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (bienfaits.isNotEmpty) ...[
          Text(
            'product.benefits'.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...bienfaits.map(
            (b) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        LucideIcons.sparkles,
                        size: 18,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(b)),
                  ],
                ),
              ),
            ),
          ),
        ],
        if (tags.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text(
            'product.tags'.tr(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((t) {
              final label = locale == 'en' && t.nameEn != null
                  ? t.nameEn!
                  : t.nameFr;
              return Chip(
                label: Text(label),
                backgroundColor: colorScheme.secondaryContainer,
                labelStyle: TextStyle(color: colorScheme.onSecondaryContainer),
              );
            }).toList(),
          ),
        ],
        // Similar Products
        const SizedBox(height: 32),
        _SimilarProductsSection(productId: product.id),
      ],
    );
  }
}

class _UsageTab extends StatelessWidget {
  final models.Product product;
  final Color categoryColor;
  const _UsageTab({required this.product, required this.categoryColor});

  List<models.UsageSection> _parseUsages() {
    return product.usages ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final usages = _parseUsages();

    if (usages.isEmpty) return EmptyState.noData();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: usages.map((u) {
        final locale = context.locale.languageCode;
        final title = u.getLocalizedTitle(locale);
        final content = u.getLocalizedContent(locale);
        const IconData iconData = LucideIcons.lightbulb;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(iconData, size: 22, color: categoryColor),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 22, color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpertNoteCard extends StatelessWidget {
  final String note;
  final Color color;
  const _ExpertNoteCard({required this.note, required this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.quote, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                "Le mot de l'expert", // TODO: Localize
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair Display', // Serif font for elegance
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            note,
            style: TextStyle(
              color: colorScheme.onSurface,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _SimilarProductsSection extends ConsumerWidget {
  final String productId;
  const _SimilarProductsSection({required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarAsync = ref.watch(similarProductsProvider(productId));

    return similarAsync.when(
      data: (products) {
        if (products.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'product.similar_products'.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardCompact(
                    product: products[index],
                    onTap: () => context.push('/product/${products[index].id}'),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
