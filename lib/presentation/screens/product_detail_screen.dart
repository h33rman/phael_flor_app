import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/category_colors.dart';
import '../../core/providers/providers.dart';
import '../../data/sources/local/app_database.dart' as db;
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

class _ProductDetailBody extends StatelessWidget {
  final db.Product product;

  const _ProductDetailBody({required this.product});

  String _getProductName(BuildContext context) {
    final locale = context.locale.languageCode;
    return locale == 'en' && product.nameEn != null
        ? product.nameEn!
        : product.nameFr;
  }

  Color get _categoryColor => CategoryColors.forCategory(product.category);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 280,
              pinned: true,
              backgroundColor: _categoryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (product.imageUrl != null)
                      CachedNetworkImage(
                        imageUrl: product.imageUrl!,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => Container(
                          color: _categoryColor.withValues(alpha: 0.3),
                        ),
                      )
                    else
                      Container(color: _categoryColor.withValues(alpha: 0.3)),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 60,
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
                IconButton(
                  icon: const Icon(LucideIcons.heart),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(LucideIcons.share2),
                  onPressed: () {},
                ),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.category != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _categoryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'categories.${product.category}'.tr(),
                          style: TextStyle(
                            color: _categoryColor,
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
                    if (product.scientificName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        product.scientificName!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (product.weightVolume != null) ...[
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
                            product.weightVolume!,
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
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
                  labelColor: _categoryColor,
                  unselectedLabelColor: colorScheme.onSurfaceVariant,
                  indicatorColor: _categoryColor,
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
                product: product,
                categoryColor: _categoryColor,
              ),
              _AboutTab(product: product),
              _UsageTab(product: product, categoryColor: _categoryColor),
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

class _CharacteristicsTab extends StatelessWidget {
  final db.Product product;
  final Color categoryColor;
  const _CharacteristicsTab({
    required this.product,
    required this.categoryColor,
  });

  List<String> _parse(String? json) {
    if (json == null) return [];
    try {
      return List<String>.from(jsonDecode(json));
    } catch (_) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final ingredients = _parse(product.ingredients);
    final certs = _parse(product.certifications);

    if (ingredients.isEmpty && certs.isEmpty && product.form == null)
      return EmptyState.noData();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (product.form != null) ...[
          _InfoCard(
            icon: LucideIcons.box,
            title: 'product.tabs.characteristics'.tr(), // Or form specific key
            content: product.form!,
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
            spacing: 8,
            runSpacing: 8,
            children: certs
                .map(
                  (c) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      c,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _AboutTab extends StatelessWidget {
  final db.Product product;
  const _AboutTab({required this.product});

  List<String> _getBienfaits(BuildContext context) {
    final locale = context.locale.languageCode;
    try {
      if (locale == 'en' && product.bienfaitsEn != null)
        return List<String>.from(jsonDecode(product.bienfaitsEn!));
      if (product.bienfaitsFr != null)
        return List<String>.from(jsonDecode(product.bienfaitsFr!));
    } catch (_) {}
    return [];
  }

  List<String> _parseTags() {
    if (product.tags == null) return [];
    try {
      return List<String>.from(jsonDecode(product.tags!));
    } catch (_) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bienfaits = _getBienfaits(context);
    final tags = _parseTags();

    if (bienfaits.isEmpty && tags.isEmpty) return EmptyState.noData();

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
            children: tags
                .map(
                  (t) => Chip(
                    label: Text(t),
                    backgroundColor: colorScheme.secondaryContainer,
                    labelStyle: TextStyle(
                      color: colorScheme.onSecondaryContainer,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }
}

class _UsageTab extends StatelessWidget {
  final db.Product product;
  final Color categoryColor;
  const _UsageTab({required this.product, required this.categoryColor});

  List<Map<String, dynamic>> _parseUsages() {
    if (product.usages == null) return [];
    try {
      return List<Map<String, dynamic>>.from(jsonDecode(product.usages!));
    } catch (_) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final usages = _parseUsages();

    if (usages.isEmpty) return EmptyState.noData();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: usages.map((u) {
        final title = u['title'] as String? ?? '';
        final content = u['content'] as String? ?? '';
        final icon = u['icon'] as String? ?? 'info';
        IconData iconData;
        switch (icon) {
          case 'kitchen':
            iconData = LucideIcons.chefHat;
            break;
          case 'medical':
            iconData = LucideIcons.heartPulse;
            break;
          case 'beauty':
            iconData = LucideIcons.sparkles;
            break;
          case 'warning':
            iconData = LucideIcons.alertTriangle;
            break;
          default:
            iconData = LucideIcons.lightbulb;
        }

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
