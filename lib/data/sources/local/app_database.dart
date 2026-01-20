import 'dart:convert';
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
  TextColumn get iconUrl => text().nullable()(); // Added in v15
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
  // Short description/Excerpt
  TextColumn get excerptFr => text().nullable()();
  TextColumn get excerptEn => text().nullable()();

  TextColumn get scientificName => text().nullable()();
  TextColumn get form => text().nullable()(); // powder, liquid, leaf, etc.
  TextColumn get category => text().nullable().references(
    CategoryLabels,
    #key,
  )(); // spice, essential_oil, etc.
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
  TextColumn get usages => text().nullable()(); // JSON array as string

  TextColumn get expertNoteFr => text().nullable()();
  TextColumn get expertNoteEn => text().nullable()();

  // Relations
  TextColumn get tagsIds => text().nullable()(); // JSON List<String> of IDs
  TextColumn get certificationsIds =>
      text().nullable()(); // JSON List<String> of IDs

  // Meta
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ═══════════════════════════════════════════════════════════════
// TABLE: Metadata Labels
// ═══════════════════════════════════════════════════════════════
class FormLabels extends Table {
  TextColumn get key => text()();
  TextColumn get label => text()(); // JSON

  @override
  Set<Column> get primaryKey => {key};
}

class CategoryLabels extends Table {
  TextColumn get key => text()();
  TextColumn get label => text()(); // JSON
  TextColumn get iconUrl => text().nullable()(); // Added in v15
  TextColumn get color => text().nullable()(); // Added in v11

  @override
  Set<Column> get primaryKey => {key};
}

class ArticleCategoryLabels extends Table {
  TextColumn get key => text()();
  TextColumn get label => text()(); // JSON

  @override
  Set<Column> get primaryKey => {key};
}

// ═══════════════════════════════════════════════════════════════
// TABLE: Certifications & Tags
// ═══════════════════════════════════════════════════════════════
class Certifications extends Table {
  TextColumn get id => text()();
  TextColumn get nameFr => text()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get logoUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Tags extends Table {
  TextColumn get id => text()();
  TextColumn get labelFr => text()();
  TextColumn get labelEn => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// ═══════════════════════════════════════════════════════════════
// TABLE: User Data
// ═══════════════════════════════════════════════════════════════
class Favorites extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productId => text().nullable().references(Products, #id)();
  TextColumn get articleId => text().nullable().references(Articles, #id)();
}

// ═══════════════════════════════════════════════════════════════
// TABLE: Articles
// ═══════════════════════════════════════════════════════════════
class Articles extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()(); // JSON
  TextColumn get excerpt => text().nullable()(); // JSON
  TextColumn get content => text().nullable()(); // JSON / HTML
  TextColumn get category => text().references(ArticleCategoryLabels, #key)();
  IntColumn get readTime => integer().nullable()();
  TextColumn get featureImageUrl => text().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  TextColumn get tags => text().nullable()(); // JSON
  TextColumn get relatedProductIds => text().nullable()(); // JSON
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    Brands,
    Products,
    FormLabels,
    CategoryLabels,
    ArticleCategoryLabels,
    Favorites,
    Articles,
    Certifications,
    Tags,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  @override
  @override
  int get schemaVersion => 16;

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
        if (from < 2) {
          await m.createTable(favorites);
        }
        if (from < 3) {
          await m.createTable(articles);
        }
        if (from < 4) {
          await m.deleteTable(favorites.actualTableName);
          await m.createTable(favorites);
        }
        if (from < 5) {
          try {
            await m.addColumn(products, products.excerptFr);
          } catch (e) {
            // ignore: avoid_print
            print('Migration warning: excerptFr likely exists: $e');
          }
          try {
            await m.addColumn(products, products.excerptEn);
          } catch (e) {
            // ignore: avoid_print
            print('Migration warning: excerptEn likely exists: $e');
          }
        }
        if (from < 6) {
          await m.createTable(certifications);
        }
        if (from < 7) {
          await m.createTable(tags);
        }
        if (from < 9) {
          // Tables productCertifications and productTags were added here,
          // but they are now removed in v13.
        }
        if (from < 10) {
          await m.createTable(articleCategoryLabels);
        }
        if (from < 11) {
          await m.addColumn(categoryLabels, categoryLabels.color);
        }
        if (from < 12) {
          await m.addColumn(products, products.expertNoteFr);
          await m.addColumn(products, products.expertNoteEn);
        }
        if (from < 13) {
          await m.addColumn(products, products.tagsIds);
          await m.addColumn(products, products.certificationsIds);
          // Drop old join tables
          await customStatement('DROP TABLE IF EXISTS product_tags;');
          await customStatement('DROP TABLE IF EXISTS product_certifications;');
        }
        if (from < 14) {
          // Re-create CategoryLabels to ensure it has 'label' and 'color' columns
          // Fixes "table category_labels has no column named label" error
          await customStatement('DROP TABLE IF EXISTS category_labels;');
          await customStatement('DROP TABLE IF EXISTS category_labels;');
          await m.createTable(categoryLabels);
        }
        if (from < 15) {
          await m.addColumn(brands, brands.iconUrl);
          await m.addColumn(categoryLabels, categoryLabels.iconUrl);
        }
        if (from < 16) {
          // Re-create Favorites table to ensure explicit ID and constraints are correct
          await m.deleteTable(favorites.actualTableName);
          await m.createTable(favorites);
        }
      },
    );
  }

  // ... (Existing Brands/Product queries) ...

  // ═══════════════════════════════════════════════════════════════
  // FAVORITES QUERIES
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
  // ARTICLES QUERIES

  // ═══════════════════════════════════════════════════════════════
  // ARTICLES QUERIES
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

  // ... (rest of the class)

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

  /// Paginated fetch with complex filtering
  Future<List<Product>> getProductsPaginated({
    required int limit,
    required int offset,
    String? searchQuery,
    List<String>? brandIds,
    List<String>? forms,
    String? category,
  }) {
    final query = select(products);

    // Apply filters via where clauses
    query.where((p) {
      final List<Expression<bool>> conditions = [];

      // 1. Search Query
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final pattern = '%${searchQuery.toLowerCase()}%';
        conditions.add(
          p.nameFr.lower().like(pattern) |
              p.nameEn.lower().like(pattern) |
              p.scientificName.lower().like(pattern) |
              p.tags.lower().like(pattern),
        );
      }

      // 2. Brand Filter
      if (brandIds != null && brandIds.isNotEmpty) {
        conditions.add(p.brandId.isIn(brandIds));
      }

      // 3. Form Filter (Stored as string in DB)
      if (forms != null && forms.isNotEmpty) {
        conditions.add(p.form.isIn(forms));
      }

      // 4. Category Filter
      if (category != null && category.isNotEmpty) {
        conditions.add(p.category.equals(category));
      }

      // Combine all conditions with AND
      if (conditions.isEmpty) return const Constant(true);
      return conditions.reduce((a, b) => a & b);
    });

    // Apply pagination
    query.limit(limit, offset: offset);

    // Ensure deterministic order
    query.orderBy([(t) => OrderingTerm(expression: t.nameFr)]);

    return query.get();
  }

  Future<void> insertOrUpdateProduct(ProductsCompanion product) =>
      into(products).insertOnConflictUpdate(product);

  Future<void> insertProducts(List<ProductsCompanion> productsList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(products, productsList);
    });
  }

  // ═══════════════════════════════════════════════════════════════
  // TAGS & CERTIFICATIONS QUERIES
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

  // Relations
  Future<List<Tag>> getTagsForProduct(String productId) async {
    final product = await (select(
      products,
    )..where((p) => p.id.equals(productId))).getSingleOrNull();

    if (product?.tagsIds == null) return [];

    try {
      final ids = List<String>.from(jsonDecode(product!.tagsIds!) as List);
      return (select(tags)..where((t) => t.id.isIn(ids))).get();
    } catch (e) {
      return [];
    }
  }

  Future<List<Certification>> getCertificationsForProduct(
    String productId,
  ) async {
    final product = await (select(
      products,
    )..where((p) => p.id.equals(productId))).getSingleOrNull();

    if (product?.certificationsIds == null) return [];

    try {
      final ids = List<String>.from(
        jsonDecode(product!.certificationsIds!) as List,
      );
      return (select(certifications)..where((c) => c.id.isIn(ids))).get();
    } catch (e) {
      return [];
    }
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

  Future<void> insertArticleCategoryLabels(
    List<ArticleCategoryLabelsCompanion> labels,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(articleCategoryLabels, labels);
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
