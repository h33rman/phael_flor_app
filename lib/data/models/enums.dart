// Product Form - Physical state of the product
enum ProductForm {
  powder,
  liquid,
  leaf,
  bark,
  stick,
  seed,
  root,
  flower,
  gel,
  oil,
  paste,
  whole,
  bean;

  String get labelKey => name;

  static ProductForm? fromString(String? value) {
    if (value == null) return null;
    return ProductForm.values.where((e) => e.name == value).firstOrNull;
  }
}

// Product Category - Product family/usage
enum ProductCategory {
  essentialOil,
  spice,
  herb,
  shampoo,
  bodyCare,
  soap,
  infusion,
  supplement,
  aromatherapy,
  cooking,
  cleaning,
  vegetableOil,
  cosmetics,
  extracts,
  superfoods;

  String get labelKey {
    switch (this) {
      case ProductCategory.essentialOil:
        return 'essential_oil';
      case ProductCategory.bodyCare:
        return 'body_care';
      case ProductCategory.vegetableOil:
        return 'vegetable_oil';
      default:
        return name;
    }
  }

  static ProductCategory? fromString(String? value) {
    if (value == null) return null;

    return ProductCategory.values.where((e) {
      final name = e.name.toLowerCase();
      final key = e.labelKey.toLowerCase();
      final input = value.toLowerCase();
      // Check exact match, label match, or singular/plural match
      return name == input ||
          key == input ||
          name == input.replaceAll('_', '') ||
          // Handle plural 's' at end of input (e.g. oils -> oil)
          name == input.replaceAll(RegExp(r's$'), '') ||
          key == input.replaceAll(RegExp(r's$'), '');
    }).firstOrNull;
  }
}
