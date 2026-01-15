import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

/// Language selection screen with list layout
class LanguageSelectorScreen extends StatelessWidget {
  const LanguageSelectorScreen({super.key});

  Future<void> _selectLanguage(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', locale.languageCode);
    if (context.mounted) context.go('/theme');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentLocale = context.locale;

    final languages = [
      _LanguageOption(
        locale: const Locale('fr'),
        flag: '🇫🇷',
        name: 'Français',
        nativeName: 'French',
      ),
      _LanguageOption(
        locale: const Locale('en'),
        flag: '🇬🇧',
        name: 'English',
        nativeName: 'Anglais',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // Icon
              Center(
                child:
                    Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: colorScheme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            LucideIcons.languages,
                            size: 40,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        )
                        .animate()
                        .fade(duration: 600.ms)
                        .scale(curve: Curves.easeOutBack),
              ),

              const SizedBox(height: 32),

              Text(
                'choose_language'.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),

              const SizedBox(height: 12),

              Text(
                'language_subtitle'.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 300.ms),

              const Spacer(),

              // Language Options
              ...languages.asMap().entries.map((entry) {
                final lang = entry.value;
                final isSelected = currentLocale == lang.locale;

                return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Material(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () => _selectLanguage(context, lang.locale),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  lang.flag,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    lang.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? colorScheme.onPrimary
                                              : colorScheme.onSurface,
                                        ),
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    LucideIcons.checkCircle2,
                                    color: colorScheme.onPrimary,
                                    size: 24,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .animate(
                      delay: Duration(milliseconds: 400 + entry.key * 100),
                    )
                    .fade()
                    .slideX();
              }),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageOption {
  final Locale locale;
  final String flag;
  final String name;
  final String nativeName;

  const _LanguageOption({
    required this.locale,
    required this.flag,
    required this.name,
    required this.nativeName,
  });
}
