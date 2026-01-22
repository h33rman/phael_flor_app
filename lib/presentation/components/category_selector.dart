import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/color_utils.dart';
import '../../core/providers/providers.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      data: (categoriesData) {
        final categories = [
          _CategoryItem(
            slug: null,
            name: 'home.all'.tr(),
            icon: LucideIcons.layoutGrid,
            color: colorScheme.primary,
            iconUrl: null,
          ),
          ...categoriesData.map((cat) {
            // Determine icon from DB or fallback
            // We use a generic icon since we don't have the mapping anymore,
            // relying on iconUrl mostly.
            const icon = LucideIcons.sprout;

            // Use localized name column
            final isFr = context.locale.languageCode == 'fr';
            final name = isFr ? cat.nameFr : (cat.nameEn ?? cat.nameFr);

            // Parse color from DB or fallback
            final categoryColor = ColorUtils.parseHex(
              cat.color,
              fallback: colorScheme.primary,
            );

            return _CategoryItem(
              slug: cat.slug,
              name: name,
              icon: icon,
              color: categoryColor,
              iconUrl: cat.iconUrl,
            );
          }),
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'home.categories'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return _buildCategoryItem(
                    context,
                    ref,
                    cat.slug,
                    cat.name,
                    cat.icon,
                    cat.color,
                    cat.iconUrl,
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    WidgetRef ref,
    String? slug,
    String name,
    IconData icon,
    Color color,
    String? iconUrl,
  ) {
    final currentCategory = ref.watch(selectedCategoryProvider);
    final isSelected = currentCategory == slug;
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = isSelected ? Colors.white : color;

    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryProvider.notifier).state = slug;
      },
      child: Container(
        width: 84,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: isSelected ? color : color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: color, width: 3) : null,
              ),
              child: Center(
                child: iconUrl != null
                    ? SvgPicture.network(
                        iconUrl,
                        width: 32,
                        height: 32,
                        colorFilter: ColorFilter.mode(
                          iconColor,
                          BlendMode.srcIn,
                        ),
                        placeholderBuilder: (_) =>
                            Icon(icon, size: 32, color: iconColor),
                      )
                    : Icon(icon, size: 32, color: iconColor),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? color : colorScheme.onSurfaceVariant,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem {
  final String? slug;
  final String name;
  final IconData icon;
  final Color color;
  final String? iconUrl;

  _CategoryItem({
    required this.slug,
    required this.name,
    required this.icon,
    required this.color,
    this.iconUrl,
  });
}
