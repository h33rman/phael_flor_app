import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';

/// Language selection screen
class LanguageSelectorScreen extends StatelessWidget {
  const LanguageSelectorScreen({super.key});

  Future<void> _selectLanguage(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    if (context.mounted) Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.languages,
                      size: 44,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                    duration: 500.ms,
                  ),

              const SizedBox(height: 32),

              Text(
                'choose_language'.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ).animate(delay: 200.ms).fadeIn(duration: 500.ms),

              const SizedBox(height: 8),

              Text(
                'language_subtitle'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ).animate(delay: 300.ms).fadeIn(duration: 500.ms),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child:
                        _LanguageCard(
                              flag: '🇫🇷',
                              name: 'Français',
                              onTap: () =>
                                  _selectLanguage(context, const Locale('fr')),
                            )
                            .animate(delay: 400.ms)
                            .fadeIn()
                            .slideX(begin: -0.2, end: 0),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child:
                        _LanguageCard(
                              flag: '🇬🇧',
                              name: 'English',
                              onTap: () =>
                                  _selectLanguage(context, const Locale('en')),
                            )
                            .animate(delay: 500.ms)
                            .fadeIn()
                            .slideX(begin: 0.2, end: 0),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  final String flag;
  final String name;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.flag,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorScheme.outlineVariant, width: 1),
          ),
          child: Column(
            children: [
              Text(flag, style: const TextStyle(fontSize: 48)),
              const SizedBox(height: 12),
              Text(
                name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
