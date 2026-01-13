import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

// ═══════════════════════════════════════════════════════════════
// TABLE: Brands
// ═══════════════════════════════════════════════════════════════
class Brands extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get descriptionFr => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ═══════════════════════════════════════════════════════════════
// TABLE: Products
// ═══════════════════════════════════════════════════════════════
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get brandId => text().references(Brands, #id)();

  // Physical Characteristics
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get scientificName => text().nullable()();
  TextColumn get form => text().nullable()(); // powder, liquid, leaf, etc.
  TextColumn get category => text().nullable()(); // spice, essential_oil, etc.
  TextColumn get weightVolume => text().nullable()();
  TextColumn get ingredients => text().nullable()(); // JSON array as string
  TextColumn get certifications => text().nullable()(); // JSON array as string

  // Images
  TextColumn get imageUrl => text().nullable()();
  TextColumn get galleryUrls => text().nullable()(); // JSON array as string

  // About Details
  TextColumn get tags => text().nullable()(); // JSON array as string
  TextColumn get bienfaitsFr => text().nullable()(); // JSON array as string
  TextColumn get bienfaitsEn => text().nullable()(); // JSON array as string

  // Usage (stored as JSON)
  TextColumn get usages => text().nullable()(); // JSON array of usage sections

  // Meta
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ═══════════════════════════════════════════════════════════════
// TABLE: Form Labels (for localization)
// ═══════════════════════════════════════════════════════════════
class FormLabels extends Table {
  TextColumn get key => text()();
  TextColumn get labelFr => text()();
  TextColumn get labelEn => text()();

  @override
  Set<Column> get primaryKey => {key};
}

// ═══════════════════════════════════════════════════════════════
// TABLE: Category Labels (for localization)
// ═══════════════════════════════════════════════════════════════
class CategoryLabels extends Table {
  TextColumn get key => text()();
  TextColumn get labelFr => text()();
  TextColumn get labelEn => text()();

  @override
  Set<Column> get primaryKey => {key};
}

// ═══════════════════════════════════════════════════════════════
// DATABASE
// ═══════════════════════════════════════════════════════════════
@DriftDatabase(tables: [Brands, Products, FormLabels, CategoryLabels])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'phael_flor_db');
  }

  // ═══════════════════════════════════════════════════════════════
  // BRAND QUERIES
  // ═══════════════════════════════════════════════════════════════
  Future<List<Brand>> getAllBrands() => select(brands).get();

  Future<Brand?> getBrandById(String id) =>
      (select(brands)..where((b) => b.id.equals(id))).getSingleOrNull();

  Future<void> insertOrUpdateBrand(BrandsCompanion brand) =>
      into(brands).insertOnConflictUpdate(brand);

  Future<void> insertBrands(List<BrandsCompanion> brandsList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(brands, brandsList);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // PRODUCT QUERIES
  // ═══════════════════════════════════════════════════════════════
  Future<List<Product>> getAllProducts() => select(products).get();

  Future<List<Product>> getProductsByBrand(String brandId) =>
      (select(products)..where((p) => p.brandId.equals(brandId))).get();

  Future<Product?> getProductById(String id) =>
      (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();

  /// Full-text search on product names and tags
  Future<List<Product>> searchProducts(String query) {
    final searchPattern = '%${query.toLowerCase()}%';
    return (select(products)..where(
          (p) =>
              p.nameFr.lower().like(searchPattern) |
              p.nameEn.lower().like(searchPattern) |
              p.scientificName.lower().like(searchPattern) |
              p.tags.lower().like(searchPattern),
        ))
        .get();
  }

  Future<void> insertOrUpdateProduct(ProductsCompanion product) =>
      into(products).insertOnConflictUpdate(product);

  Future<void> insertProducts(List<ProductsCompanion> productsList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(products, productsList);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // LABELS QUERIES
  // ═══════════════════════════════════════════════════════════════
  Future<List<FormLabel>> getAllFormLabels() => select(formLabels).get();
  Future<List<CategoryLabel>> getAllCategoryLabels() =>
      select(categoryLabels).get();

  Future<void> insertFormLabels(List<FormLabelsCompanion> labels) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(formLabels, labels);
    });
  }

  Future<void> insertCategoryLabels(
    List<CategoryLabelsCompanion> labels,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(categoryLabels, labels);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // SYNC HELPERS
  // ═══════════════════════════════════════════════════════════════
  Future<void> clearAllData() async {
    await delete(products).go();
    await delete(brands).go();
    await delete(formLabels).go();
    await delete(categoryLabels).go();
  }
}
