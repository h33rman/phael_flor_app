import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/models/store.dart';

/// Reusable store card widget
class StoreCard extends StatelessWidget {
  final Store store;
  final VoidCallback? onTap;

  const StoreCard({super.key, required this.store, this.onTap});

  Future<void> _openMaps() async {
    final url = Uri.parse(store.googleMapsUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _callPhone() async {
    if (store.phone == null) return;
    final url = Uri.parse('tel:${store.phone}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> _sendEmail() async {
    if (store.email == null) return;
    final url = Uri.parse('mailto:${store.email}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Store image
            if (store.imageUrl != null)
              SizedBox(
                height: 140,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: store.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    color: colorScheme.surfaceContainerHighest,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    color: colorScheme.surfaceContainerHighest,
                    child: Icon(
                      LucideIcons.store,
                      size: 48,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              )
            else
              Container(
                height: 100,
                width: double.infinity,
                color: colorScheme.primaryContainer,
                child: Icon(
                  LucideIcons.store,
                  size: 48,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),

            // Store details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    store.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Address
                  if (store.fullAddress.isNotEmpty)
                    _InfoRow(icon: LucideIcons.mapPin, text: store.fullAddress),

                  // Phone
                  if (store.phone != null) ...[
                    const SizedBox(height: 4),
                    _InfoRow(icon: LucideIcons.phone, text: store.phone!),
                  ],

                  const SizedBox(height: 16),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _openMaps,
                          icon: const Icon(LucideIcons.map, size: 18),
                          label: const Text('Itinéraire'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (store.phone != null)
                        IconButton.filled(
                          onPressed: _callPhone,
                          icon: const Icon(LucideIcons.phone, size: 20),
                        ),
                      if (store.email != null)
                        IconButton.outlined(
                          onPressed: _sendEmail,
                          icon: const Icon(LucideIcons.mail, size: 20),
                        ),
                    ],
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
