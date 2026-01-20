import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/category_colors.dart';
import '../../core/providers/providers.dart';
import '../../data/sources/local/app_database.dart' as db;

/// Elegant product card with rounded image, favorite button, and view action
class ProductCard extends ConsumerWidget {
  final db.Product product;
  final String? brandName; // Pass brand name directly
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.product,
    this.brandName,
    this.onTap,
    this.onFavoriteToggle,
    this.isFavorite = false,
  });

  String _getLocalizedName(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' && product.nameEn != null
        ? product.nameEn!
        : product.nameFr;
  }

  db.CategoryLabel? _getCategoryLabel(WidgetRef ref) {
    return ref
        .watch(categoryLabelsProvider)
        .asData
        ?.value
        .firstWhere(
          (l) => l.key == product.category,
          orElse: () => const db.CategoryLabel(key: '', label: ''),
        );
  }

  Color _getCategoryColor(WidgetRef ref, db.CategoryLabel? label) {
    if (label?.color != null) {
      final parsed = CategoryColors.parseColor(label!.color);
      if (parsed != null) return parsed;
    }
    return CategoryColors.forCategory(product.category);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryLabel = _getCategoryLabel(ref);
    final categoryColor = _getCategoryColor(ref, categoryLabel);

    // Determine icon for category fallback
    final catIcon = CategoryColors.iconFor(product.category);

    // Determine localized label
    String categoryText = product.category ?? 'misc';
    if (categoryLabel != null) {
      final isFr = context.locale.languageCode == 'fr';
      Map<String, dynamic> labelMap = {};
      try {
        labelMap = jsonDecode(categoryLabel.label) as Map<String, dynamic>;
      } catch (_) {
        labelMap = {'fr': categoryLabel.key};
      }
      categoryText = isFr
          ? (labelMap['fr'] ?? categoryLabel.key)
          : (labelMap['en'] ?? labelMap['fr'] ?? categoryLabel.key);
    } else {
      // Fallback if label not found in DB
      categoryText = 'categories.${product.category ?? 'misc'}'.tr();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with favorite button
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Product image with rounded corners
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                      child: Container(
                        color: categoryColor.withValues(alpha: 0.08),
                        child: product.imageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: product.imageUrl!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                placeholder: (_, __) =>
                                    _buildPlaceholder(categoryColor),
                                errorWidget: (_, __, ___) =>
                                    _buildPlaceholder(categoryColor),
                              )
                            : _buildPlaceholder(categoryColor),
                      ),
                    ),
                  ),

                  // Favorite button - top right corner
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: onFavoriteToggle,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isFavorite
                              ? colorScheme.primaryContainer
                              : colorScheme.surface.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : LucideIcons.heart,
                          size: 18,
                          color: isFavorite
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),

                  // Brand badge - top left corner (Neutral/Brand Color)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.tertiaryContainer.withValues(
                          alpha: 0.9,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.store,
                            size: 12,
                            color: colorScheme.onTertiaryContainer,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            brandName ?? 'Phael Flor',
                            style: TextStyle(
                              color: colorScheme.onTertiaryContainer,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      _getLocalizedName(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Category tag and Hashtags
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        // Category Container
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: categoryColor.withValues(alpha: 0.3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (categoryLabel?.iconUrl != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: SvgPicture.network(
                                    categoryLabel!.iconUrl!,
                                    width: 12,
                                    height: 12,
                                    colorFilter: ColorFilter.mode(
                                      categoryColor,
                                      BlendMode.srcIn,
                                    ),
                                    placeholderBuilder: (_) => Icon(
                                      catIcon,
                                      size: 12,
                                      color: categoryColor,
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Icon(
                                    catIcon,
                                    size: 12,
                                    color: categoryColor,
                                  ),
                                ),
                              Flexible(
                                child: Text(
                                  categoryText, // Use parsed text here
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: categoryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Hashtags (First 2)
                        Builder(
                          builder: (context) {
                            if (product.tags == null) {
                              return const SizedBox.shrink();
                            }
                            try {
                              final List<dynamic> tagsList = jsonDecode(
                                product.tags!,
                              );
                              final tagsToShow = tagsList.take(2).toList();

                              if (tagsToShow.isEmpty) {
                                return const SizedBox.shrink();
                              }

                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: tagsToShow.map((tag) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: Text(
                                      '#$tag',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: colorScheme.secondary,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            // fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  );
                                }).toList(),
                              );
                            } catch (e) {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Bottom row: Weight + View button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Weight/Volume with package icon
                        if (product.weightVolume != null)
                          Row(
                            children: [
                              Icon(
                                LucideIcons.package,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                product.weightVolume!,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          )
                        else
                          const SizedBox.shrink(),

                        // View button - Material 3 FilledButton style
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'common.view'.tr(),
                                  style: TextStyle(
                                    color: colorScheme.onPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  LucideIcons.arrowRight,
                                  size: 14,
                                  color: colorScheme.onPrimary,
                                ),
                              ],
                            ),
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
    );
  }

  Widget _buildPlaceholder(Color color) {
    return Center(
      child: Icon(
        LucideIcons.leaf,
        size: 48,
        color: color.withValues(alpha: 0.4),
      ),
    );
  }
}

/// Compact version for horizontal lists
class ProductCardCompact extends ConsumerWidget {
  final db.Product product;
  final String? brandName;
  final VoidCallback? onTap;
  final double width;

  const ProductCardCompact({
    super.key,
    required this.product,
    this.brandName,
    this.onTap,
    this.width = 160,
  });

  String _getLocalizedName(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'en' && product.nameEn != null
        ? product.nameEn!
        : product.nameFr;
  }

  Color _getCategoryColor(WidgetRef ref) {
    final dynamicColors = ref.watch(categoryColorsProvider).asData?.value;
    return CategoryColors.forCategory(
      product.category,
      dynamicColors: dynamicColors,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = _getCategoryColor(ref);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: categoryColor.withValues(alpha: 0.08),
                  child: product.imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: product.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (_, __) => Center(
                            child: Icon(
                              LucideIcons.leaf,
                              size: 32,
                              color: categoryColor.withValues(alpha: 0.4),
                            ),
                          ),
                          errorWidget: (_, __, ___) => Center(
                            child: Icon(
                              LucideIcons.leaf,
                              size: 32,
                              color: categoryColor.withValues(alpha: 0.4),
                            ),
                          ),
                        )
                      : Center(
                          child: Icon(
                            LucideIcons.leaf,
                            size: 32,
                            color: categoryColor.withValues(alpha: 0.4),
                          ),
                        ),
                ),
              ),
            ),

            // Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getLocalizedName(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (product.weightVolume != null)
                          Row(
                            children: [
                              Icon(
                                LucideIcons.package,
                                size: 12,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                product.weightVolume!,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: categoryColor, // Use category color here
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            LucideIcons.arrowRight,
                            size: 12,
                            color: Colors
                                .white, // Ensure visible on category color
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
    );
  }
}
