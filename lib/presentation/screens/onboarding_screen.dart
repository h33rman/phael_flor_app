import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Onboarding screen with swipeable pages
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    if (mounted) context.go('/home');
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final pages = [
      _OnboardingPage(
        icon: LucideIcons.leaf,
        titleKey: 'onboarding.welcome_title',
        descKey: 'onboarding.welcome_desc',
        color: colorScheme.primary, // Flat color usage
      ),
      _OnboardingPage(
        icon: LucideIcons.search,
        titleKey: 'onboarding.search_title',
        descKey: 'onboarding.search_desc',
        color: colorScheme.tertiary,
      ),
      _OnboardingPage(
        icon: LucideIcons.wifiOff,
        titleKey: 'onboarding.offline_title',
        descKey: 'onboarding.offline_desc',
        color: colorScheme.secondary,
      ),
    ];

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, top: 16),
                child: TextButton(
                  onPressed: _completeOnboarding,
                  child: Text(
                    'skip'.tr(),
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) => setState(() => _currentPage = page),
                itemCount: pages.length,
                itemBuilder: (context, index) => pages[index],
              ),
            ),

            // Navigation Area
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 32 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? colorScheme.primary
                              : colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _nextPage,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentPage == pages.length - 1
                            ? 'get_started'.tr()
                            : 'next'.tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String descKey;
  final Color color;

  const _OnboardingPage({
    required this.icon,
    required this.titleKey,
    required this.descKey,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flat Circle Icon
          Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1), // Gentle background
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(32),
                child: Icon(icon, size: 80, color: color),
              )
              .animate()
              .fade(duration: 800.ms)
              .scale(curve: Curves.easeOutBack, duration: 800.ms),

          const SizedBox(height: 56),

          Text(
            titleKey.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ).animate(delay: 200.ms).fade().slideY(begin: 0.1, end: 0),

          const SizedBox(height: 16),

          Text(
            descKey.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
              fontSize: 16,
            ),
          ).animate(delay: 300.ms).fade(),
        ],
      ),
    );
  }
}
