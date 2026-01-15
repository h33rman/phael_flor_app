import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/providers/providers.dart';
import '../../data/models/enums.dart';

class FilterModal extends ConsumerStatefulWidget {
  const FilterModal({super.key});

  @override
  ConsumerState<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends ConsumerState<FilterModal> {
  late ProductFilter _tempFilter;

  @override
  void initState() {
    super.initState();
    // Initialize with current filter state
    _tempFilter = ref.read(activeFilterProvider);
  }

  void _toggleBrand(String brandId) {
    final newBrands = Set<String>.from(_tempFilter.brandIds);
    if (newBrands.contains(brandId)) {
      newBrands.remove(brandId);
    } else {
      newBrands.add(brandId);
    }
    setState(() {
      _tempFilter = _tempFilter.copyWith(brandIds: newBrands);
    });
  }

  void _toggleForm(ProductForm form) {
    final newForms = Set<ProductForm>.from(_tempFilter.forms);
    if (newForms.contains(form)) {
      newForms.remove(form);
    } else {
      newForms.add(form);
    }
    setState(() {
      _tempFilter = _tempFilter.copyWith(forms: newForms);
    });
  }

  void _resetFilters() {
    setState(() {
      _tempFilter = const ProductFilter();
    });
  }

  void _applyFilters() {
    ref.read(activeFilterProvider.notifier).state = _tempFilter;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final brandsAsync = ref.watch(brandsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
      // Max height constraint for better UX
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'filter.title'.tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: _resetFilters,
                child: Text('filter.reset'.tr()),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),

          // Scrollable content
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brands Section
                  Text(
                    'filter.brands'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  brandsAsync.when(
                    data: (brands) {
                      if (brands.isEmpty) return const SizedBox.shrink();
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: brands.map((brand) {
                          final isSelected = _tempFilter.brandIds.contains(
                            brand.id,
                          );
                          return FilterChip(
                            label: Text(brand.name),
                            selected: isSelected,
                            onSelected: (_) => _toggleBrand(brand.id),
                            selectedColor: colorScheme.primaryContainer,
                            checkmarkColor: colorScheme.primary,
                            labelStyle: TextStyle(
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.onSurface,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          );
                        }).toList(),
                      );
                    },
                    loading: () => const LinearProgressIndicator(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 24),

                  // Forms Section
                  Text(
                    'filter.forms'.tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ProductForm.values.map((form) {
                      final isSelected = _tempFilter.forms.contains(form);
                      return FilterChip(
                        label: Text(
                          form.labelKey,
                        ), // Should be localized ideally
                        selected: isSelected,
                        onSelected: (_) => _toggleForm(form),
                        selectedColor: colorScheme.secondaryContainer,
                        checkmarkColor: colorScheme.secondary,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? colorScheme.secondary
                              : colorScheme.onSurface,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _applyFilters,
              icon: const Icon(LucideIcons.check),
              label: Text('filter.apply'.tr()),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
