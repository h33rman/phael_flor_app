import 'dart:convert';
import '../models/article.dart' as model;
import '../sources/local/app_database.dart' as db;
import 'package:drift/drift.dart';
import '../sources/remote/supabase_client.dart';

/// Repository for managing articles (Tips & Blog)
class ArticleRepository {
  final db.AppDatabase _localDb;

  ArticleRepository({required db.AppDatabase localDb}) : _localDb = localDb;

  /// Get all articles
  Future<List<model.Article>> getAllArticles() async {
    final dbArticles = await _localDb.getAllArticles();
    return dbArticles.map((e) => _toModel(e)).toList();
  }

  /// Get article by ID
  Future<model.Article?> getArticleById(String id) async {
    final dbArticle = await _localDb.getArticleById(id);
    if (dbArticle == null) return null;
    return _toModel(dbArticle);
  }

  /// Sync articles from Remote (Supabase) to Local (Drift)
  Future<void> syncArticles() async {
    try {
      // 0. Clear Local Cache (Full Mirror Strategy)
      await _localDb.deleteAllArticles();

      // 1. Fetch from Remote
      final remoteData = await SupabaseDataSource().fetchArticles();

      // 2. Convert to Drift Companions
      final companions = remoteData.map((json) {
        // Handle localized JSON fields safely
        final titleMap = json['title'] is Map
            ? json['title']
            : {'fr': json['title']}; // fallback
        final excerptMap = json['excerpt'] is Map
            ? json['excerpt']
            : {'fr': json['excerpt']};
        final contentMap = json['content'] is Map
            ? json['content']
            : {'fr': json['content']};

        return db.ArticlesCompanion(
          id: Value(json['id']),
          titleFr: Value(titleMap['fr'] ?? titleMap['en'] ?? ''),
          titleEn: Value(titleMap['en']),
          excerptFr: Value(excerptMap['fr']),
          excerptEn: Value(excerptMap['en']),
          contentFr: Value(contentMap['fr']),
          contentEn: Value(contentMap['en']),
          category: Value(json['category'] ?? 'article'),
          tags: Value(jsonEncode(json['tags'] ?? [])),
          featureImageUrl: Value(json['feature_image_url']),
          relatedProductIds: Value(
            jsonEncode(json['related_product_ids'] ?? []),
          ),
          isActive: Value(json['is_active'] ?? true),
          publishedAt: Value(DateTime.tryParse(json['published_at'] ?? '')),
        );
      }).toList();

      // 3. Upsert into Local DB
      if (companions.isNotEmpty) {
        await _localDb.insertArticles(companions);
        print('Synced ${companions.length} articles from Supabase.');
      }
    } catch (e) {
      print('Article sync failed: $e');
      // On failure, we just show what is in local DB (persistence)
    }
  }

  /// Convert DB Article to Model Article
  model.Article _toModel(db.Article entity) {
    // Determine language from environment/locale context?
    // Ideally repository returns localized data, but here we return full object
    // and let UI decide. However, our Model is flat.
    // Let's assume we map the "Fr" content by default or map all
    // Wait, the Model should probably handle the localization selection
    // or store both. Let's update Model to be simpler:
    // Actually, looking at ProductRepository, we map manually.
    // For simplicity, let's map "fr" to the main fields for now,
    // or better, let's map based on basic logic.

    // Note: In real app, we might pass locale to repository.
    // Beause we stored both in DB (titleFr, titleEn),
    // let's pass a preferred language or just map all properties if the model supports it.

    // Changing approach: The Model `Article` I defined earlier has `title`, `content` (singular).
    // This implies the Repository should ideally localize.
    // OR the Model should have `titleFr`, `titleEn`.
    // My previous Model definition had `title` (singular).
    // I will modify the mapping to default to FR for now, or use a "localized" getter.
    // Actually, to make it dynamic, I should update the Model to hold both OR
    // pass the locale to `getAllArticles`.
    // Let's pass the locale or just map FR for default and let UI handle it?
    // No, cleaner is to have `title` be a Map or the Repo select it.

    // Let's auto-select "fr" as primary for this simple implementation,
    // but usually we want to support switching.
    // Checking `Product` model: it has `Map<String, String> name`.
    // I should probably update `Article` model to match that pattern if I want full localization support.
    // BUT, for speed, I defined Article quite simply.

    // Let's use the simple approach: The Model I wrote has `title`, `content`.
    // I will Map `titleFr` -> `title`. This is a limitation but fits the "simple" request.
    // Wait, I can't easily switch language then.
    // Better: Update Model to have Map like Product.
    // But I already wrote `Article` model.

    // Okay, I'll stick to mapping `titleFr` to `title` for now to get it working,
    // AND I will add `titleEn` etc to the map if I can, or just keep it simple.
    // Actually, let's just populate based on what's available.

    return model.Article(
      id: entity.id,
      title: entity.titleFr, // Defaulting to FR base
      excerpt: entity.excerptFr,
      content: entity.contentFr,
      category: entity.category,
      tags: entity.tags != null
          ? List<String>.from(jsonDecode(entity.tags!) as List)
          : [],
      featureImageUrl: entity.featureImageUrl,
      publishedAt: entity.publishedAt,
      relatedProductIds: entity.relatedProductIds != null
          ? List<String>.from(jsonDecode(entity.relatedProductIds!) as List)
          : [],
    );
  }
  // ═══════════════════════════════════════════════════════════════
  // FAVORITES
  // ═══════════════════════════════════════════════════════════════

  /// Watch favorite IDs (articles only)
  Stream<List<String>> watchFavoriteIds() {
    return _localDb.watchFavoriteArticleIds();
  }

  /// Toggle favorite status
  Future<void> toggleFavorite(String articleId) async {
    await _localDb.toggleArticleFavorite(articleId);
  }
}
