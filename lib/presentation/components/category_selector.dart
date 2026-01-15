import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/constants/category_colors.dart';
import '../../core/providers/providers.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final categories = [
      _CategoryItem(
        key: null,
        label: 'home.all'.tr(),
        icon: LucideIcons.layoutGrid,
        color: colorScheme.primary,
      ),
      _CategoryItem(
        key: 'spice',
        label: 'categories.spice'.tr(),
        icon: LucideIcons.flame,
        color: CategoryColors.spice,
      ),
      _CategoryItem(
        key: 'essential_oil',
        label: 'categories.essential_oil'.tr(),
        icon: LucideIcons.droplets,
        color: CategoryColors.essentialOil,
      ),
      _CategoryItem(
        key: 'herb',
        label: 'categories.herb'.tr(),
        icon: LucideIcons.leaf,
        color: CategoryColors.herb,
      ),
      _CategoryItem(
        key: 'body_care',
        label: 'categories.body_care'.tr(),
        icon: LucideIcons.sparkles,
        color: CategoryColors.bodyCare,
      ),
      _CategoryItem(
        key: 'infusion',
        label: 'categories.infusion'.tr(),
        icon: LucideIcons.coffee,
        color: CategoryColors.infusion,
      ),
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
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'home.view_all'.tr(),
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return _buildCategoryItem(
                context,
                ref,
                cat.key,
                cat.label,
                cat.icon,
                cat.color,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    WidgetRef ref,
    String? key,
    String label,
    IconData icon,
    Color color,
  ) {
    final currentCategory = ref.watch(selectedCategoryProvider);
    final isSelected = currentCategory == key;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryProvider.notifier).state = key;
      },
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
                color: isSelected ? color : color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
                border: isSelected ? Border.all(color: color, width: 3) : null,
              ),
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? Colors.white : color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? color : colorScheme.onSurfaceVariant,
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
