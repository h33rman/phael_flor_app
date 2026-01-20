import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

/// Category colors for product types
class CategoryColors {
  CategoryColors._();

  static const Color spice = Color(0xFFD84315);
  static const Color essentialOil = Color(0xFF7B1FA2);
  static const Color herb = Color(0xFF388E3C);
  static const Color bodyCare = Color(0xFF1976D2);
  static const Color infusion = Color(0xFF00838F);
  static const Color supplement = Color(0xFF5D4037);

  static Color forCategory(
    String? category, {
    Map<String, Color>? dynamicColors,
  }) {
    if (category == null) return herb;

    // Check dynamic colors first
    if (dynamicColors != null && dynamicColors.containsKey(category)) {
      return dynamicColors[category]!;
    }

    switch (category) {
      case 'spice':
        return spice;
      case 'essential_oil':
        return essentialOil;
      case 'herb':
        return herb;
      case 'body_care':
        return bodyCare;
      case 'infusion':
        return infusion;
      case 'supplement':
        return supplement;
      case 'vegetable_oil':
        return const Color(0xFFFF8F00); // Amber 800
      case 'soap':
        return const Color(0xFF8D6E63); // Brown 400
      case 'shampoo':
        return const Color(0xFF0288D1); // Light Blue 700
      default:
        return herb;
    }
  }

  /// Parse a hex color string from DB (e.g. "#RRGGBB" or "RRGGBB")
  static Color? parseColor(String? hexString) {
    if (hexString == null || hexString.isEmpty) return null;
    try {
      final hex = hexString.replaceAll('#', '');
      return Color(int.parse('FF$hex', radix: 16));
    } catch (_) {
      return null;
    }
  }

  /// Get the default icon for a category
  static IconData iconFor(String? category) {
    if (category == null) return LucideIcons.tag;
    switch (category) {
      case 'spice':
        return LucideIcons.flame;
      case 'essential_oil':
        return LucideIcons.droplets;
      case 'herb':
        return LucideIcons.leaf;
      case 'body_care':
        return LucideIcons.sparkles;
      case 'infusion':
        return LucideIcons.coffee;
      case 'vegetable_oil':
        return LucideIcons.droplet;
      case 'cleaning':
        return LucideIcons.sprayCan;
      default:
        return LucideIcons.tag;
    }
  }
}
