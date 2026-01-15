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
    final locale = context.locale.languageCode;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),

              // Icon
              Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LucideIcons.palette,
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

              // Title
              Text(
                'theme.title'.tr(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ).animate(delay: 200.ms).fadeIn(duration: 500.ms),

              const SizedBox(height: 8),

              // Subtitle
              Text(
                'theme.subtitle'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ).animate(delay: 300.ms).fadeIn(duration: 500.ms),

              const SizedBox(height: 48),

              // Theme options list
              ...ThemeModeOption.options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                final isSelected = currentTheme == option.mode;

                return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _ThemeOptionTile(
                        option: option,
                        isSelected: isSelected,
                        locale: locale,
                        onTap: () {
                          ref
                              .read(themeModeProvider.notifier)
                              .setThemeMode(option.mode);
                        },
                      ),
                    )
                    .animate(delay: Duration(milliseconds: 400 + index * 100))
                    .fadeIn()
                    .slideX(begin: 0.1, end: 0);
              }),

              const Spacer(),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => context.go('/onboarding'),
                  icon: const Icon(LucideIcons.arrowRight),
                  label: Text('theme.continue'.tr()),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ).animate(delay: 700.ms).fadeIn().slideY(begin: 0.2, end: 0),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  final ThemeModeOption option;
  final bool isSelected;
  final String locale;
  final VoidCallback onTap;

  const _ThemeOptionTile({
    required this.option,
    required this.isSelected,
    required this.locale,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    String getLocalizedLabel(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.light:
          return 'theme.light'.tr();
        case ThemeMode.dark:
          return 'theme.dark'.tr();
        case ThemeMode.system:
          return 'theme.system'.tr();
      }
    }

    return Material(
      color: isSelected
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  option.icon,
                  size: 22,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 16),

              // Label
              Expanded(
                child: Text(
                  getLocalizedLabel(option.mode),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.onSurface,
                  ),
                ),
              ),

              // Checkmark
              if (isSelected)
                Icon(LucideIcons.check, color: colorScheme.primary, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
