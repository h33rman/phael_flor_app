import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/providers.dart';

import '../components/components.dart';

/// Favorites screen showing saved products
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteProductsProvider);
    final brandsAsync = ref.watch(brandsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    // Create a map of brand ID to brand name for quick lookup
    final brandMap = brandsAsync.maybeWhen(
      data: (brands) => {for (var b in brands) b.id: b.name},
      orElse: () => <String, String>{},
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'favorites.title'
              .tr(), // Make sure to add this key or use 'Favorites'
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return const FloralEmptyState();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];
              return FavoriteProductCard(
                product: product,
                brandName: brandMap[product.brandId],
                onTap: () => context.push('/product/${product.id}'),
                onRemove: () {
                  ref
                      .read(productRepositoryProvider)
                      .toggleFavorite(product.id);
                },
              );
            },
          );
        },
        loading: () => const Center(child: NatureLoader()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
