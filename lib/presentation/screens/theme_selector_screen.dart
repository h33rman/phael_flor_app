import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/providers/theme_provider.dart';

/// Theme selector screen - part of onboarding
class ThemeSelectorScreen extends ConsumerWidget {
  const ThemeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentTheme = ref.watch(themeModeProvider);

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
                            color: colorScheme.tertiaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            LucideIcons.palette,
                            size: 40,
                            color: colorScheme.onTertiaryContainer,
                          ),
                        )
                        .animate()
                        .fade(duration: 600.ms)
                        .scale(curve: Curves.easeOutBack),
              ),

              const SizedBox(height: 32),

              // Title
              Text(
                'theme.title'.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                'theme.subtitle'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ).animate().fade(delay: 300.ms),

              const Spacer(),

              // Theme options list
              ...ThemeModeOption.options.asMap().entries.map((entry) {
                final option = entry.value;
                final isSelected = currentTheme == option.mode;

                return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Material(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(themeModeProvider.notifier)
                                .setThemeMode(option.mode);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  option.icon,
                                  size: 24,
                                  color: isSelected
                                      ? colorScheme.onPrimary
                                      : colorScheme.onSurface,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    _getLocalizedLabel(option.mode),
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

              const Spacer(flex: 2),

              // Continue button
              FilledButton.icon(
                onPressed: () => context.go('/onboarding'),
                icon: const Icon(LucideIcons.arrowRight),
                label: Text('theme.continue'.tr()),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ).animate(delay: 700.ms).fadeIn().slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }

  String _getLocalizedLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'theme.light'.tr();
      case ThemeMode.dark:
        return 'theme.dark'.tr();
      case ThemeMode.system:
        return 'theme.system'.tr();
    }
  }
}
