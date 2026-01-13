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
  whole;

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
  cleaning;

  String get labelKey {
    switch (this) {
      case ProductCategory.essentialOil:
        return 'essential_oil';
      case ProductCategory.bodyCare:
        return 'body_care';
      default:
        return name;
    }
  }

  static ProductCategory? fromString(String? value) {
    if (value == null) return null;
    final normalized = value.replaceAll('_', '');
    return ProductCategory.values
        .where(
          (e) =>
              e.name.toLowerCase() == normalized.toLowerCase() ||
              e.labelKey == value,
        )
        .firstOrNull;
  }
}
