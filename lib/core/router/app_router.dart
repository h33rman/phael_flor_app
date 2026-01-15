import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../presentation/screens/screens.dart';

/// Provider for checking if onboarding is complete
final hasSeenOnboardingProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasSeenOnboarding') ?? false;
});

/// App router configuration
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // Splash screen
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding flow
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/language',
        name: 'language',
        builder: (context, state) => const LanguageSelectorScreen(),
      ),
      GoRoute(
        path: '/theme',
        name: 'theme',
        builder: (context, state) => const ThemeSelectorScreen(),
      ),

      // Main app
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const MainNavigation(),
      ),

      // Product detail
      GoRoute(
        path: '/product/:id',
        name: 'product',
        builder: (context, state) {
          final productId = state.pathParameters['id']!;
          return ProductDetailScreen(productId: productId);
        },
      ),

      // Article detail
      GoRoute(
        path: '/article/:id',
        name: 'article',
        builder: (context, state) {
          final articleId = state.pathParameters['id']!;
          return ArticleDetailScreen(articleId: articleId);
        },
      ),

      // Favorites
      GoRoute(
        path: '/favorites',
        name: 'favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),

      // Settings
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const MainNavigation(),
      ),

      // Auth
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => const MainNavigation(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
});
