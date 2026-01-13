import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../components/components.dart';

/// Profile screen with user info and settings
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    const isLoggedIn = false;
    const userName = 'Invité';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ProfileHeader(
            userName: userName,
            isLoggedIn: isLoggedIn,
            onSignIn: () => Navigator.of(context).pushNamed('/auth'),
          ),

          const SizedBox(height: 24),

          MenuListTile(
            icon: LucideIcons.heart,
            title: 'Mes Favoris',
            subtitle: '0 produits',
            onTap: () {},
          ),
          MenuListTile(
            icon: LucideIcons.star,
            title: 'Mes Avis',
            subtitle: isLoggedIn ? 'Voir mes avis' : 'Connexion requise',
            onTap: () {},
          ),
          MenuListTile(
            icon: LucideIcons.history,
            title: 'Historique',
            subtitle: 'Produits consultés',
            onTap: () {},
          ),

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),

          MenuListTile(
            icon: LucideIcons.languages,
            title: 'Langue',
            subtitle: context.locale.languageCode == 'fr'
                ? 'Français'
                : 'English',
            trailing: const Icon(LucideIcons.chevronRight),
            onTap: () => _showLanguageDialog(context, colorScheme),
          ),
          MenuListTile(
            icon: LucideIcons.moon,
            title: 'Thème',
            subtitle: 'Automatique',
            trailing: const Icon(LucideIcons.chevronRight),
            onTap: () {},
          ),
          MenuListTile(
            icon: LucideIcons.bell,
            title: 'Notifications',
            subtitle: 'Gérer les alertes',
            trailing: const Icon(LucideIcons.chevronRight),
            onTap: () {},
          ),

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),

          MenuListTile(icon: LucideIcons.info, title: 'À propos', onTap: () {}),
          MenuListTile(
            icon: LucideIcons.helpCircle,
            title: 'Aide & FAQ',
            onTap: () {},
          ),
          MenuListTile(
            icon: LucideIcons.shield,
            title: 'Confidentialité',
            onTap: () {},
          ),

          if (isLoggedIn) ...[
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(LucideIcons.logOut),
              label: const Text('Déconnexion'),
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.error,
                side: BorderSide(color: colorScheme.error),
              ),
            ),
          ],

          const SizedBox(height: 32),
          Center(
            child: Text(
              'Phael Flor v1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, ColorScheme colorScheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choisir la langue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Text('🇫🇷', style: TextStyle(fontSize: 24)),
              title: const Text('Français'),
              trailing: context.locale.languageCode == 'fr'
                  ? Icon(LucideIcons.check, color: colorScheme.primary)
                  : null,
              onTap: () {
                context.setLocale(const Locale('fr'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Text('🇬🇧', style: TextStyle(fontSize: 24)),
              title: const Text('English'),
              trailing: context.locale.languageCode == 'en'
                  ? Icon(LucideIcons.check, color: colorScheme.primary)
                  : null,
              onTap: () {
                context.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final String userName;
  final bool isLoggedIn;
  final VoidCallback onSignIn;

  const _ProfileHeader({
    required this.userName,
    required this.isLoggedIn,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: colorScheme.primary,
            child: Icon(
              isLoggedIn ? LucideIcons.user : LucideIcons.userCircle,
              size: 32,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isLoggedIn ? userName : 'Bienvenue !',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isLoggedIn
                      ? 'Membre Phael Flor'
                      : 'Connectez-vous pour plus de fonctionnalités',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimaryContainer.withValues(
                      alpha: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!isLoggedIn)
            FilledButton(onPressed: onSignIn, child: const Text('Connexion')),
        ],
      ),
    );
  }
}
