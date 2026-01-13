import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/store.dart';
import '../components/components.dart';

/// Stores screen showing partner retail locations
class StoresScreen extends ConsumerWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sample stores - TODO: Replace with stores provider
    final stores = [
      Store(
        id: '1',
        name: 'Phael Flor Boutique',
        address: '123 Rue des Épices',
        city: 'Antananarivo',
        region: 'Analamanga',
        phone: '+261 34 00 000 00',
        email: 'boutique@phaelflor.mg',
        imageUrl:
            'https://images.unsplash.com/photo-1604719312566-8912e9227c6a?w=400',
      ),
      Store(
        id: '2',
        name: 'Naturel Bio Shop',
        address: '45 Avenue de la Liberté',
        city: 'Toamasina',
        region: 'Atsinanana',
        phone: '+261 34 11 111 11',
        email: 'contact@naturelbio.mg',
      ),
      Store(
        id: '3',
        name: 'Épicerie Verte',
        address: '78 Boulevard Principal',
        city: 'Antsirabe',
        region: 'Vakinankaratra',
        phone: '+261 34 22 222 22',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Nos Boutiques')),
      body: stores.isEmpty
          ? EmptyState.noData(message: 'Aucune boutique disponible')
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: stores.length,
              itemBuilder: (context, index) => StoreCard(store: stores[index]),
            ),
    );
  }
}
