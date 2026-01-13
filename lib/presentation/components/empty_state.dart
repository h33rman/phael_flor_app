import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

/// Reusable empty state widget with icon, title, and optional subtitle
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final double iconSize;
  final Widget? action;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.iconSize = 72,
    this.action,
  });

  /// Preset for no favorites
  factory EmptyState.noFavorites() {
    return const EmptyState(
      icon: LucideIcons.heart,
      title: 'Aucun favori',
      subtitle: 'Appuyez sur ❤️ pour ajouter des produits',
    );
  }

  /// Preset for no search results
  factory EmptyState.noResults() {
    return const EmptyState(
      icon: LucideIcons.searchX,
      title: 'Aucun résultat',
      subtitle: 'Essayez avec d\'autres termes',
    );
  }

  /// Preset for no data
  factory EmptyState.noData({String? message}) {
    return EmptyState(
      icon: LucideIcons.info,
      title: message ?? 'Aucune information disponible',
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    );
  }
}
