import 'dart:convert';
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
    final labelsAsync = ref.watch(categoryLabelsProvider);

    return labelsAsync.when(
      data: (labels) {
        final categories = [
          _CategoryItem(
            key: null,
            label: 'home.all'.tr(),
            icon: LucideIcons.layoutGrid,
            color: colorScheme.primary,
          ),
          ...labels.map((l) {
            // Determine icon based on key or fallback
            IconData icon = LucideIcons.tag;
            if (l.key == 'spice') icon = LucideIcons.flame;
            if (l.key == 'essential_oil') icon = LucideIcons.droplets;
            if (l.key == 'herb') icon = LucideIcons.leaf;
            if (l.key == 'body_care') icon = LucideIcons.sparkles;
            if (l.key == 'infusion') icon = LucideIcons.coffee;
            if (l.key == 'vegetable_oil') icon = LucideIcons.droplet;
            if (l.key == 'cleaning') icon = LucideIcons.sprayCan;

            // Use localized label from JSON
            final isFr = context.locale.languageCode == 'fr';
            Map<String, dynamic> labelMap = {};
            try {
              labelMap = jsonDecode(l.label) as Map<String, dynamic>;
            } catch (_) {
              labelMap = {'fr': l.key};
            }

            final labelText = isFr
                ? (labelMap['fr'] ?? l.key)
                : (labelMap['en'] ?? labelMap['fr'] ?? l.key);

            return _CategoryItem(
              key: l.key,
              label: labelText,
              icon: icon,
              color: CategoryColors.forCategory(l.key),
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
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
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
