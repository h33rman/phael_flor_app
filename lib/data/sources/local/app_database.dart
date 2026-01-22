import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

// ═══════════════════════════════════════════════════════════════
// 1. LOOKUP TABLES
// ═══════════════════════════════════════════════════════════════

@DataClassName('Category')
class Categories extends Table {
  TextColumn get slug => text()(); // PK
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get iconUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {slug};
}

@DataClassName('Form')
class Forms extends Table {
  TextColumn get slug => text()(); // PK
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();

  @override
  Set<Column> get primaryKey => {slug};
}

@DataClassName('Brand')
class Brands extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get descriptionFr => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get iconUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Tag')
class Tags extends Table {
  TextColumn get id => text()();
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get iconUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Certification')
class Certifications extends Table {
  TextColumn get id => text()();
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get logoUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ═══════════════════════════════════════════════════════════════
// 2. CORE ENTITIES
// ═══════════════════════════════════════════════════════════════

@DataClassName('Product')
class Products extends Table {
  TextColumn get id => text()();
  TextColumn get brandId => text().nullable().references(Brands, #id)();
  TextColumn get categorySlug =>
      text().nullable().references(Categories, #slug)();
  TextColumn get formSlug => text().nullable().references(Forms, #slug)();

  // Names
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get scientificName => text().nullable()();

  // Physical
  TextColumn get volume => text().nullable()();
  TextColumn get weight => text().nullable()();

  // Content
  TextColumn get excerptFr => text().nullable()();
  TextColumn get excerptEn => text().nullable()();
  TextColumn get descriptionFr => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  TextColumn get benefitsFr => text().nullable()();
  TextColumn get benefitsEn => text().nullable()();
  TextColumn get usageFr => text().nullable()();
  TextColumn get usageEn => text().nullable()();
  TextColumn get expertNoteFr => text().nullable()();
  TextColumn get expertNoteEn => text().nullable()();

  // Media
  TextColumn get imageUrl => text().nullable()();
  TextColumn get galleryUrls => text().nullable()(); // JSON List<String>

  // Meta
  BoolColumn get isNew => boolean().withDefault(const Constant(false))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Article')
class Articles extends Table {
  TextColumn get id => text()();
  TextColumn get categorySlug =>
      text().nullable().references(Categories, #slug)();

  TextColumn get titleFr => text()();
  TextColumn get titleEn => text().nullable()();
  TextColumn get excerptFr => text().nullable()();
  TextColumn get excerptEn => text().nullable()();
  TextColumn get contentFr => text().nullable()();
  TextColumn get contentEn => text().nullable()();

  TextColumn get imageUrl => text().nullable()();
  IntColumn get readTimeMinutes => integer().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

// ═══════════════════════════════════════════════════════════════
// 3. JOIN TABLES
// ═══════════════════════════════════════════════════════════════

class ProductTags extends Table {
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get tagId => text().references(Tags, #id)();

  @override
  Set<Column> get primaryKey => {productId, tagId};
}

class ProductCertifications extends Table {
  TextColumn get productId => text().references(Products, #id)();
  TextColumn get certificationId => text().references(Certifications, #id)();

  @override
  Set<Column> get primaryKey => {productId, certificationId};
}

// ═══════════════════════════════════════════════════════════════
// 4. USER DATA
// ═══════════════════════════════════════════════════════════════

class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().nullable().references(Products, #id)();
  TextColumn get articleId => text().nullable().references(Articles, #id)();
}

@DriftDatabase(
  tables: [
    Brands,
    Categories,
    Forms,
    Tags,
    Certifications,
    Products,
    Articles,
    ProductTags,
    ProductCertifications,
    Favorites,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 20;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'phael_flor_db');
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Deep Clean: If upgrading to v20, strictly drop all and recreate.
        if (to >= 20) {
          // Flatten database by dropping all tables known to Drift
          await customStatement('PRAGMA foreign_keys = OFF');
          for (final table in allTables) {
            await m.deleteTable(table.actualTableName);
          }
          await m.createAll();
          await customStatement('PRAGMA foreign_keys = ON');
        }
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════
  // 1. LOOKUP QUERIES
  // ═══════════════════════════════════════════════════════════════

  // --- BRANDS ---
  Future<List<Brand>> getAllBrands() => select(brands).get();
  Future<Brand?> getBrandById(String id) =>
      (select(brands)..where((b) => b.id.equals(id))).getSingleOrNull();

  Future<void> insertBrands(List<BrandsCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(brands, list);
    });
  }

  // --- CATEGORIES ---
  Future<List<Category>> getAllCategories() => select(categories).get();

  Future<void> insertCategories(List<CategoriesCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(categories, list);
    });
  }

  // --- FORMS ---
  Future<List<Form>> getAllForms() => select(forms).get();

  Future<void> insertForms(List<FormsCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(forms, list);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // 2. TAGS & CERTIFICATIONS
  // ═══════════════════════════════════════════════════════════════
  Future<List<Tag>> getAllTags() => select(tags).get();

  Future<void> insertTags(List<TagsCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(tags, list);
    });
  }

  Future<List<Certification>> getAllCertifications() =>
      select(certifications).get();

  Future<void> insertCertifications(List<CertificationsCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(certifications, list);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // 3. PRODUCT QUERIES
  // ═══════════════════════════════════════════════════════════════
  Future<List<Product>> getAllProducts() => select(products).get();

  Future<Product?> getProductById(String id) =>
      (select(products)..where((p) => p.id.equals(id))).getSingleOrNull();

  Future<List<Product>> getProductsByBrand(String brandId) =>
      (select(products)..where((p) => p.brandId.equals(brandId))).get();

  /// Paginated fetch with filtering
  Future<List<Product>> getProductsPaginated({
    required int limit,
    required int offset,
    String? searchQuery,
    List<String>? brandIds,
    List<String>? forms,
    String? category, // This search via categorySlug
  }) {
    final query = select(products);

    query.where((p) {
      final List<Expression<bool>> conditions = [];

      // 1. Search Query
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final pattern = '%${searchQuery.toLowerCase()}%';
        conditions.add(
          p.nameFr.lower().like(pattern) |
              p.nameEn.lower().like(pattern) |
              p.scientificName.lower().like(pattern),
        );
      }

      // 2. Brand Filter
      if (brandIds != null && brandIds.isNotEmpty) {
        conditions.add(p.brandId.isIn(brandIds));
      }

      // 3. Form Filter
      if (forms != null && forms.isNotEmpty) {
        conditions.add(p.formSlug.isIn(forms));
      }

      // 4. Category Filter
      if (category != null && category.isNotEmpty) {
        conditions.add(p.categorySlug.equals(category));
      }

      if (conditions.isEmpty) return const Constant(true);
      return conditions.reduce((a, b) => a & b);
    });

    query.limit(limit, offset: offset);
    // Deterministic Sort
    query.orderBy([(t) => OrderingTerm(expression: t.nameFr)]);

    return query.get();
  }

  Future<void> insertProducts(List<ProductsCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(products, list);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // 4. RELATIONS QUERIES (JOIN TABLES)
  // ═══════════════════════════════════════════════════════════════

  Future<List<Tag>> getTagsForProduct(String productId) async {
    // Join Tags with ProductTags
    final query = select(
      tags,
    ).join([innerJoin(productTags, productTags.tagId.equalsExp(tags.id))]);
    query.where(productTags.productId.equals(productId));
    return query.map((row) => row.readTable(tags)).get();
  }

  Future<List<Certification>> getCertificationsForProduct(
    String productId,
  ) async {
    final query = select(certifications).join([
      innerJoin(
        productCertifications,
        productCertifications.certificationId.equalsExp(certifications.id),
      ),
    ]);
    query.where(productCertifications.productId.equals(productId));
    return query.map((row) => row.readTable(certifications)).get();
  }

  // Insert Joins (Sync)
  Future<void> insertProductTags(List<ProductTagsCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(productTags, list);
    });
  }

  Future<void> insertProductCertifications(
    List<ProductCertificationsCompanion> list,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(productCertifications, list);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // 5. ARTICLES QUERIES
  // ═══════════════════════════════════════════════════════════════
  Future<List<Article>> getAllArticles() {
    return (select(articles)..orderBy([
          (t) =>
              OrderingTerm(expression: t.publishedAt, mode: OrderingMode.desc),
        ]))
        .get();
  }

  Future<Article?> getArticleById(String id) {
    return (select(articles)..where((a) => a.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertArticles(List<ArticlesCompanion> list) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(articles, list);
    });
  }

  Future<void> deleteAllArticles() => delete(articles).go();

  // ═══════════════════════════════════════════════════════════════
  // 6. FAVORITES QUERIES
  // ═══════════════════════════════════════════════════════════════
  Stream<List<String>> watchFavoriteProductIds() {
    return (select(
      favorites,
    )..where((f) => f.productId.isNotNull())).map((f) => f.productId!).watch();
  }

  Stream<List<String>> watchFavoriteArticleIds() {
    return (select(
      favorites,
    )..where((f) => f.articleId.isNotNull())).map((f) => f.articleId!).watch();
  }

  Future<List<String?>> getFavoriteIds() {
    return select(favorites).map((f) => f.productId).get();
  }

  Future<void> toggleProductFavorite(String id) async {
    final exists = await (select(
      favorites,
    )..where((f) => f.productId.equals(id))).getSingleOrNull();

    if (exists != null) {
      await (delete(favorites)..where((f) => f.productId.equals(id))).go();
    } else {
      await into(favorites).insert(
        FavoritesCompanion(productId: Value(id), articleId: const Value(null)),
      );
    }
  }

  Future<void> toggleArticleFavorite(String id) async {
    final exists = await (select(
      favorites,
    )..where((f) => f.articleId.equals(id))).getSingleOrNull();

    if (exists != null) {
      await (delete(favorites)..where((f) => f.articleId.equals(id))).go();
    } else {
      await into(favorites).insert(
        FavoritesCompanion(articleId: Value(id), productId: const Value(null)),
      );
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // 7. SYNC HELPERS (RESET)
  // ═══════════════════════════════════════════════════════════════
  Future<void> clearAllData() async {
    await delete(products).go();
    await delete(brands).go();
    await delete(forms).go();
    await delete(categories).go();
    await delete(tags).go();
    await delete(certifications).go();
    await delete(productTags).go();
    await delete(productCertifications).go();
    await delete(articles).go();
    // Keep favorites? Or drop them too?
    // If we're wiping schema, IDs might change if not careful, but uuids should stay.
    // Let's safe keep favorites if possible, but schema version 20 wipes everything anyway.
    // So logic here is redundant compared to migration but useful for manual clear.
  }
}
