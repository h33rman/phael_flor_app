import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/providers/providers.dart';
import 'home_screen.dart';
import 'journal_screen.dart';
import 'stores_screen.dart';
import 'profile_screen.dart';
import 'favorites_screen.dart';

class MainNavigation extends ConsumerWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the scroll controller from a provider if needed, or manage it here.
    // However, since we switched to ConsumerWidget, we need to adapt state handling.
    // For simplicity, we can keep the scroll controller local if we convert back to
    // ConsumerStatefulWidget or manage it via a provider.
    // Let's stick to ConsumerStatefulWidget for scroll controller state.
    return const _MainNavigationContent();
  }
}

class _MainNavigationContent extends ConsumerStatefulWidget {
  const _MainNavigationContent();

  @override
  ConsumerState<_MainNavigationContent> createState() => _MainNavigationState();
}

class _MainNavigationState extends ConsumerState<_MainNavigationContent> {
  final ScrollController _homeScrollController = ScrollController();

  @override
  void dispose() {
    _homeScrollController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    final currentIndex = ref.read(navIndexProvider);
    if (currentIndex == index && index == 0) {
      if (_homeScrollController.hasClients) {
        _homeScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
        );
      }
    } else {
      ref.read(navIndexProvider.notifier).state = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navIndexProvider);

    final screens = [
      HomeScreen(scrollController: _homeScrollController),
      const JournalScreen(),
      const StoresScreen(),
      const ProfileScreen(),
    ];

    ref.listen<AsyncValue<bool>>(isOnlineProvider, (previous, next) {
      final isOnline = next.value ?? true;
      final wasOnline = previous?.value ?? true;

      if (!isOnline && wasOnline) {
        // Navigate to Favorites when going offline
        // Use a slight delay to ensure context is ready or avoid build collisions
        Future.microtask(() {
          if (context.mounted) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const FavoritesScreen()));
          }
        });
      }
    });

    // Handle initial offline state
    // Remove the blocking return

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          NavigationDestination(
            icon: const Icon(LucideIcons.home),
            selectedIcon: const Icon(LucideIcons.home),
            label: 'nav.home'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(LucideIcons.bookOpen),
            selectedIcon: const Icon(LucideIcons.bookOpen),
            label: 'nav.journal'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(LucideIcons.store),
            selectedIcon: const Icon(LucideIcons.store),
            label: 'nav.stores'.tr(),
          ),
          NavigationDestination(
            icon: const Icon(LucideIcons.user),
            selectedIcon: const Icon(LucideIcons.user),
            label: 'nav.profile'.tr(),
          ),
        ],
      ),
    );
  }
}
