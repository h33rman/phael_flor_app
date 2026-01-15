import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme mode state notifier
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  static const String _themeKey = 'theme_mode';

  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey);

    if (themeString != null) {
      state = ThemeMode.values.firstWhere(
        (mode) => mode.name == themeString,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }

  /// Toggle between light and dark (ignores system)
  Future<void> toggle() async {
    if (state == ThemeMode.light) {
      await setThemeMode(ThemeMode.dark);
    } else {
      await setThemeMode(ThemeMode.light);
    }
  }
}

/// Provider for theme mode
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

/// Helper class for theme mode info
class ThemeModeOption {
  final ThemeMode mode;
  final String label;
  final String labelFr;
  final IconData icon;

  const ThemeModeOption({
    required this.mode,
    required this.label,
    required this.labelFr,
    required this.icon,
  });

  static const List<ThemeModeOption> options = [
    ThemeModeOption(
      mode: ThemeMode.light,
      label: 'Light',
      labelFr: 'Clair',
      icon: Icons.light_mode_rounded,
    ),
    ThemeModeOption(
      mode: ThemeMode.dark,
      label: 'Dark',
      labelFr: 'Sombre',
      icon: Icons.dark_mode_rounded,
    ),
    ThemeModeOption(
      mode: ThemeMode.system,
      label: 'System',
      labelFr: 'Système',
      icon: Icons.settings_suggest_rounded,
    ),
  ];
}
