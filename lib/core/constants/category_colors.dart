import 'dart:ui';

/// Category colors for product types
class CategoryColors {
  CategoryColors._();

  static const Color spice = Color(0xFFD84315);
  static const Color essentialOil = Color(0xFF7B1FA2);
  static const Color herb = Color(0xFF388E3C);
  static const Color bodyCare = Color(0xFF1976D2);
  static const Color infusion = Color(0xFF00838F);
  static const Color supplement = Color(0xFF5D4037);

  static Color forCategory(String? category) {
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
      default:
        return herb;
    }
  }
}
