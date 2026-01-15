import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'home_screen.dart';
import 'tips_screen.dart';
import 'stores_screen.dart';
import 'profile_screen.dart';

/// Main navigation shell with bottom nav bar
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final ScrollController _homeScrollController = ScrollController();

  @override
  void dispose() {
    _homeScrollController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_currentIndex == index && index == 0) {
      // If tapping Home again, scroll to top
      if (_homeScrollController.hasClients) {
        _homeScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuart,
        );
      }
    } else {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(scrollController: _homeScrollController),
      const TipsScreen(), // Replaced Favorites
      const StoresScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(LucideIcons.home),
            selectedIcon: Icon(LucideIcons.home),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.lightbulb), // Icon for Tips
            selectedIcon: Icon(LucideIcons.lightbulb),
            label: 'Conseils', // Label for Tips
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.store),
            selectedIcon: Icon(LucideIcons.store),
            label: 'Boutiques',
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.user),
            selectedIcon: Icon(LucideIcons.user),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
