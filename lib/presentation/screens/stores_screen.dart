import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/providers/providers.dart';
import '../../data/models/store.dart';
import '../components/components.dart';

/// Stores screen showing partner retail locations
class StoresScreen extends ConsumerWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    // Sample stores - TODO: Replace with stores provider
    final isOnlineAsync = ref.watch(isOnlineProvider);
    final isOnline = isOnlineAsync.value ?? true;

    if (!isOnline) {
      return Scaffold(
        appBar: AppBar(title: Text('stores.title'.tr())),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LucideIcons.wifiOff,
                    size: 48,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'offline.title'.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'offline.subtitle'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () {
                    context.push('/favorites');
                  },
                  icon: const Icon(LucideIcons.heart),
                  label: Text('offline.go_to_favorites'.tr()),
                ),
              ],
            ),
          ),
        ),
      );
    }

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
      appBar: AppBar(title: Text('stores.title'.tr())),
      body: stores.isEmpty
          ? EmptyState.noData(message: 'stores.empty'.tr())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: stores.length,
              itemBuilder: (context, index) => StoreCard(store: stores[index]),
            ),
    );
  }
}
