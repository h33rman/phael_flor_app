import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/components.dart';

/// Favorites screen showing saved products
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = <dynamic>[]; // TODO: Replace with favorites provider

    return Scaffold(
      appBar: AppBar(title: const Text('Favoris')),
      body: favorites.isEmpty
          ? EmptyState.noFavorites()
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) => Container(),
            ),
    );
  }
}
