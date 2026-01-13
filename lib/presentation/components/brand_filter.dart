import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/sources/local/app_database.dart' as db;

/// Circular brand filter chip for horizontal scrolling lists
class BrandFilterChip extends StatelessWidget {
  final db.Brand? brand; // null means "All"
  final bool isSelected;
  final VoidCallback onTap;

  const BrandFilterChip({
    super.key,
    this.brand,
    required this.isSelected,
    required this.onTap,
  });

  bool get isAllChip => brand == null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            // Avatar
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isAllChip
                    ? (isSelected
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerHighest)
                    : colorScheme.surfaceContainerHighest,
                border: isSelected
                    ? Border.all(color: colorScheme.primary, width: 3)
                    : null,
                image: !isAllChip && brand!.logoUrl != null
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(brand!.logoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: _buildContent(colorScheme),
            ),
            const SizedBox(height: 8),
            // Label
            Text(
              isAllChip ? 'Tous' : brand!.name,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : null,
                color: isSelected ? colorScheme.primary : null,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget? _buildContent(ColorScheme colorScheme) {
    if (isAllChip) {
      return Icon(
        Icons.apps_rounded,
        color: isSelected
            ? colorScheme.onPrimary
            : colorScheme.onSurfaceVariant,
        size: 24,
      );
    }

    if (brand!.logoUrl == null) {
      return Center(
        child: Text(
          brand!.name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return null;
  }
}

/// Horizontal brand filter list
class BrandFilterList extends StatelessWidget {
  final List<db.Brand> brands;
  final String? selectedBrandId;
  final ValueChanged<String?> onBrandSelected;
  final double height;
  final EdgeInsets padding;

  const BrandFilterList({
    super.key,
    required this.brands,
    required this.selectedBrandId,
    required this.onBrandSelected,
    this.height = 100,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: brands.length + 1, // +1 for "All" option
        itemBuilder: (context, index) {
          if (index == 0) {
            return BrandFilterChip(
              brand: null,
              isSelected: selectedBrandId == null,
              onTap: () => onBrandSelected(null),
            );
          }

          final brand = brands[index - 1];
          return BrandFilterChip(
            brand: brand,
            isSelected: selectedBrandId == brand.id,
            onTap: () => onBrandSelected(brand.id),
          );
        },
      ),
    );
  }
}
