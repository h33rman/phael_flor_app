import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/utils/color_utils.dart';
import '../../core/providers/providers.dart';
// import '../../data/sources/local/app_database.dart' as db; // Removed
import '../../data/models/models.dart' as models;
import '../../data/sources/local/app_database.dart'
    as db; // Keep for Category types

/// Horizontal product card specifically for the Favorites list
class FavoriteProductCard extends ConsumerWidget {
  final models.Product product;
  final String? brandName;
  final VoidCallback? onTap;
  final VoidCallback? onRemove;

  const FavoriteProductCard({
    super.key,
    required this.product,
    this.brandName,
    this.onTap,
    this.onRemove,
  });

  String _getLocalizedName(BuildContext context) {
    final locale = context.locale.languageCode;
    return product.name[locale] ??
        product.name['en'] ??
        product.name['fr'] ??
        '';
  }

  db.Category? _getCategoryLabel(WidgetRef ref) {
    if (product.categorySlug.isEmpty) return null;
    final slug = product.categorySlug;
    return ref
        .watch(categoriesProvider)
        .asData
        ?.value
        .firstWhere(
          (c) => c.slug == slug,
          orElse: () => db.Category(
            slug: slug,
            nameFr: slug,
            color: null,
            iconUrl: null,
            nameEn: null,
          ),
        );
  }

  Color _getCategoryColor(WidgetRef ref, db.Category? category) {
    return ColorUtils.parseHex(category?.color);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryData = _getCategoryLabel(ref);
    final categoryColor = _getCategoryColor(ref, categoryData);

    // Determine icon for category fallback
    // Determine icon for category fallback
    const catIcon = LucideIcons.sprout;

    // Determine localized label
    String categoryText = product.categorySlug;
    if (categoryData != null) {
      final locale = context.locale.languageCode;
      categoryText = (locale == 'en' && categoryData.nameEn != null)
          ? categoryData.nameEn!
          : categoryData.nameFr;
    } else {
      categoryText = 'categories.${product.categorySlug}'.tr();
    }

    // Premium visual: Colored shadow based on category
    final glowColor = categoryColor.withValues(alpha: 0.15);

    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove?.call(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(LucideIcons.trash2, color: colorScheme.onErrorContainer),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 125),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              // Premium Glow Effect
              BoxShadow(
                color: glowColor,
                blurRadius: 24,
                offset: const Offset(0, 8),
                spreadRadius: -4,
              ),
              // Base Shadow for depth
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left: Image Section
                SizedBox(
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(24),
                        ),
                        child: Container(
                          color: categoryColor.withValues(alpha: 0.08),
                          child: product.imageUrl != null
                              ? CachedNetworkImage(
                                  imageUrl: product.imageUrl!,
                                  fit: BoxFit.cover,
                                  placeholder: (_, __) =>
                                      _buildPlaceholder(categoryColor),
                                  errorWidget: (_, __, ___) =>
                                      _buildPlaceholder(categoryColor),
                                )
                              : _buildPlaceholder(categoryColor),
                        ),
                      ),

                      // Category Indicator Line
                      Positioned(
                        top: 12,
                        left: 0,
                        child: Container(
                          width: 4,
                          height: 24,
                          decoration: BoxDecoration(
                            color: categoryColor,
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right: Content Section
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 1. Title (Max 2 lines)
                        Text(
                          _getLocalizedName(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                height: 1.2,
                                letterSpacing: -0.3,
                              ),
                        ),

                        // 2. Scientific Name (Removed)
                        const SizedBox(height: 6),

                        // 3. Category Label (Updated to use categoryData)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (categoryData?.iconUrl != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: SvgPicture.network(
                                    categoryData!.iconUrl!,
                                    width: 10,
                                    height: 10,
                                    colorFilter: ColorFilter.mode(
                                      categoryColor,
                                      BlendMode.srcIn,
                                    ),
                                    placeholderBuilder: (_) => Icon(
                                      catIcon,
                                      size: 10,
                                      color: categoryColor,
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Icon(
                                    catIcon,
                                    size: 10,
                                    color: categoryColor,
                                  ),
                                ),
                              Text(
                                categoryText,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: categoryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 6),

                        // 4. Brand Name
                        Row(
                          children: [
                            Icon(
                              LucideIcons.store,
                              size: 12,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                brandName ?? 'Phael Flor',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // 5. Hashtags (Removed)
                        const SizedBox(height: 6),

                        // 6. Weight/Volume
                        Row(
                          children: [
                            Icon(
                              LucideIcons.package,
                              size: 13,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              [
                                if (product.weight != null) product.weight,
                                if (product.volume != null) product.volume,
                              ].join(' - '),
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    fontSize: 11,
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
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
  }

  Widget _buildPlaceholder(Color color) {
    return Center(
      child: Icon(
        LucideIcons.leaf,
        size: 32,
        color: color.withValues(alpha: 0.4),
      ),
    );
  }
}
