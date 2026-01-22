import 'package:flutter/foundation.dart';
import '../models/article.dart' as model;
import '../sources/local/app_database.dart' as db;
import 'package:drift/drift.dart';
import '../sources/remote/supabase_client.dart';
import '../../core/utils/connectivity_helper.dart';

/// Repository for managing articles (Tips & Blog)
class ArticleRepository {
  final db.AppDatabase _localDb;
  final SupabaseDataSource _remoteDb;
  final ConnectivityHelper _connectivity;

  ArticleRepository({
    required db.AppDatabase localDb,
    required SupabaseDataSource remoteDb,
    required ConnectivityHelper connectivity,
  }) : _localDb = localDb,
       _remoteDb = remoteDb,
       _connectivity = connectivity;

  /// Get all articles
  Future<List<model.Article>> getAllArticles() async {
    // ONLINE MODE: Fetch from Supabase
    if (await _connectivity.hasConnection()) {
      await syncArticles();
    }

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
      // 1. Fetch from Remote
      final remoteData = await _remoteDb.fetchArticles();

      // 2. Convert to Drift Companions
      // Schema now uses explicit columns: title_fr, title_en, etc.
      // json keys match remote schema.
      final companions = remoteData.map((json) {
        return db.ArticlesCompanion(
          id: Value(json['id'] as String),
          categorySlug: Value(json['category_slug'] as String),
          titleFr: Value(json['title_fr'] as String),
          titleEn: Value(json['title_en'] as String?),
          excerptFr: Value(json['excerpt_fr'] as String?),
          excerptEn: Value(json['excerpt_en'] as String?),
          contentFr: Value(json['content_fr'] as String?),
          contentEn: Value(json['content_en'] as String?),
          imageUrl: Value(json['feature_image_url'] as String?),
          readTimeMinutes: Value(
            json['read_time_minutes'] as int?,
          ), // ensure int
          isActive: Value(json['is_active'] as bool? ?? true),
          publishedAt: Value(
            json['published_at'] != null
                ? DateTime.parse(json['published_at'] as String)
                : null,
          ),
        );
      }).toList();

      // 3. Upsert into Local DB
      if (companions.isNotEmpty) {
        await _localDb.insertArticles(companions);
        debugPrint('Synced ${companions.length} articles from Supabase.');
      }
    } catch (e) {
      debugPrint('Article sync failed: $e.');
    }
  }

  /// Convert DB Article to Model Article
  model.Article _toModel(db.Article entity) {
    // Model expects a generic 'title' etc.
    // We provide FR by default or map both?
    // Let's look at Model... assumed to be supporting simple strings for now based on prev file.
    // Actually, prev file mapped titleMap['fr'] ?? titleMap['en'].
    // So we do the same logic here.
    // NOTE: This repository doesn't know the App Locale. Ideally it should return a localized model or a model with maps.
    // The previous implementation returned a Model with String title (resolved).
    // Let's resolve to FR (default) or EN if FR missing.

    // Check if Model supports maps?
    // Prev code: title: (titleMap['fr'] ?? ...) as String.
    // So yes, Model expects String.

    final title = entity.titleFr.isNotEmpty
        ? entity.titleFr
        : (entity.titleEn ?? '');
    final excerpt = entity.excerptFr ?? entity.excerptEn;
    final content = entity.contentFr ?? entity.contentEn;

    return model.Article(
      id: entity.id,
      title: title,
      excerpt: excerpt,
      content: content,
      category: entity.categorySlug ?? '', // Handle nullable FK
      tags:
          [], // Tags removed from Article schema? SQL says: no tags col in articles.
      // If model expects tags, we pass empty.
      featureImageUrl: entity.imageUrl,
      publishedAt: entity.publishedAt,
      relatedProductIds: [], // removed from schema for now (simplification)
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
    // Ensure article exists in local DB
    final existing = await _localDb.getArticleById(articleId);
    if (existing == null) {
      if (await _connectivity.hasConnection()) {
        await syncArticles(); // easy fallback
      }
    }
    await _localDb.toggleArticleFavorite(articleId);
  }
}
