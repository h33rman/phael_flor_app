import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:math' as math;

/// A nature-themed loading animation with orbiting leaves
class NatureLoader extends StatelessWidget {
  const NatureLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Orbiting Leaves Group
            Stack(
                  alignment: Alignment.center,
                  children: [
                    _OrbitingLeaf(
                      angle: 0,
                      color: colorScheme.primary,
                      delay: 0.ms,
                    ),
                    _OrbitingLeaf(
                      angle: 120,
                      color: colorScheme
                          .secondary, // Or use different shades of green
                      delay: 200.ms,
                    ),
                    _OrbitingLeaf(
                      angle: 240,
                      color: colorScheme.tertiary, // Or light green
                      delay: 400.ms,
                    ),
                  ],
                )
                .animate(onPlay: (controller) => controller.repeat())
                .rotate(duration: 4.seconds, curve: Curves.easeInOut),

            // Pulsing Center (Flower Core)
            Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.2, 1.2),
                  duration: 1.seconds,
                ),
          ],
        ),
      ),
    );
  }
}

class _OrbitingLeaf extends StatelessWidget {
  final double angle;
  final Color color;
  final Duration delay;

  const _OrbitingLeaf({
    required this.angle,
    required this.color,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    // Convert angle to radians
    final rad = angle * (math.pi / 180);
    // Radius of the orbit
    const radius = 24.0;

    return Transform.translate(
          offset: Offset(radius * math.cos(rad), radius * math.sin(rad)),
          child: Transform.rotate(
            angle: rad + (90 * (math.pi / 180)), // Point outward
            child: Icon(
              LucideIcons.leaf,
              size: 24, // Leaf size
              color: color,
            ),
          ),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.1, 1.1),
          duration: 1200.ms,
          delay: delay,
        );
  }
}
