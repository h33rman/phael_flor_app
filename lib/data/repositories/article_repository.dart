import 'dart:convert';
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
      try {
        final remoteData = await _remoteDb.fetchArticles();
        return remoteData
            .map((json) => _toModelFromDb(_mapJsonToDbArticle(json)))
            .toList();
      } catch (e) {
        debugPrint('Online article fetch failed: $e');
        return [];
      }
    }
    // OFFLINE MODE: Returns EMPTY (journal is online-only)
    return [];
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
      // 0. Sync Labels first (FK dependency)
      try {
        final remoteLabels = await SupabaseDataSource()
            .fetchArticleCategoryLabels();
        final labelCompanions = remoteLabels.map((json) {
          final labelMap = json['label'] as Map;
          return db.ArticleCategoryLabelsCompanion(
            key: Value(json['key']),
            label: Value(jsonEncode(labelMap)),
          );
        }).toList();
        await _localDb.insertArticleCategoryLabels(labelCompanions);
      } catch (e) {
        debugPrint('Label sync warning: $e');
      }

      // 1. Fetch from Remote
      final remoteData = await SupabaseDataSource().fetchArticles();

      // 2. Convert to Drift Companions
      final companions = remoteData.map((json) {
        // Handle localized JSON fields safely - just store the generic Map as JSON string
        final titleMap = json['title'] is Map
            ? json['title']
            : {'fr': json['title']};
        final excerptMap = json['excerpt'] is Map
            ? json['excerpt']
            : {'fr': json['excerpt']};
        final contentMap = json['content'] is Map
            ? json['content']
            : {'fr': json['content']};

        return db.ArticlesCompanion(
          id: Value(json['id']),
          title: Value(jsonEncode(titleMap)),
          excerpt: Value(excerptMap != null ? jsonEncode(excerptMap) : null),
          content: Value(contentMap != null ? jsonEncode(contentMap) : null),
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
        debugPrint('Synced ${companions.length} articles from Supabase.');
      }
    } catch (e) {
      debugPrint('Article sync failed: $e.');
    }
  }

  /// Convert DB Article to Model Article
  model.Article _toModel(db.Article entity) {
    // Parse JSON specific fields
    final titleMap = jsonDecode(entity.title) as Map;
    final excerptMap = entity.excerpt != null
        ? jsonDecode(entity.excerpt!) as Map
        : null;
    final contentMap = entity.content != null
        ? jsonDecode(entity.content!) as Map
        : null;

    // Based on previous code: title: entity.titleFr.
    // If I change DB to store JSON, I must parse it.

    // Model expects String, providing FR or EN fallback.

    return model.Article(
      id: entity.id,
      title: (titleMap['fr'] ?? titleMap['en'] ?? '') as String,
      excerpt:
          (excerptMap != null ? (excerptMap['fr'] ?? excerptMap['en']) : null)
              as String?,
      content:
          (contentMap != null ? (contentMap['fr'] ?? contentMap['en']) : null)
              as String?,
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

  // ...

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
        final remoteList = await _remoteDb.fetchArticles();
        final json = remoteList.firstWhere(
          (e) => e['id'] == articleId,
          orElse: () => {},
        );
        if (json.isNotEmpty) {
          final companion = _mapJsonToCompanion(json);
          await _localDb.insertArticles([companion]);
        }
      }
    }
    await _localDb.toggleArticleFavorite(articleId);
  }

  // Helper: JSON -> DB Article (for direct mapping not companion)
  // Used in getAllArticles if online?
  // No, getAllArticles uses _toModelFromDb(_mapJsonToDbArticle(json)) IF ONLINE?
  // _mapJsonToDbArticle logic needs update too.

  db.Article _mapJsonToDbArticle(Map<String, dynamic> json) {
    final titleMap = json['title'] is Map
        ? json['title']
        : {'fr': json['title']};
    final excerptMap = json['excerpt'] is Map
        ? json['excerpt']
        : {'fr': json['excerpt']};
    final contentMap = json['content'] is Map
        ? json['content']
        : {'fr': json['content']};

    return db.Article(
      id: json['id'],
      title: jsonEncode(titleMap),
      excerpt: excerptMap != null ? jsonEncode(excerptMap) : null,
      content: contentMap != null ? jsonEncode(contentMap) : null,
      category: json['category'] ?? 'article',
      tags: jsonEncode(json['tags'] ?? []),
      featureImageUrl: json['feature_image_url'],
      relatedProductIds: jsonEncode(json['related_product_ids'] ?? []),
      isActive: json['is_active'] ?? true,
      publishedAt: DateTime.tryParse(json['published_at'] ?? ''),
      readTime: null, // readTime is in table def? Yes.
    );
  }

  // Helper: JSON -> Companion
  db.ArticlesCompanion _mapJsonToCompanion(Map<String, dynamic> json) {
    final titleMap = json['title'] is Map
        ? json['title']
        : {'fr': json['title']};
    final excerptMap = json['excerpt'] is Map
        ? json['excerpt']
        : {'fr': json['excerpt']};
    final contentMap = json['content'] is Map
        ? json['content']
        : {'fr': json['content']};

    return db.ArticlesCompanion(
      id: Value(json['id']),
      title: Value(jsonEncode(titleMap)),
      excerpt: Value(excerptMap != null ? jsonEncode(excerptMap) : null),
      content: Value(contentMap != null ? jsonEncode(contentMap) : null),
      category: Value(json['category'] ?? 'article'),
      tags: Value(jsonEncode(json['tags'] ?? [])),
      featureImageUrl: Value(json['feature_image_url']),
      relatedProductIds: Value(jsonEncode(json['related_product_ids'] ?? [])),
      isActive: Value(json['is_active'] ?? true),
      publishedAt: Value(DateTime.tryParse(json['published_at'] ?? '')),
    );
  }

  model.Article _toModelFromDb(db.Article entity) {
    return _toModel(entity);
  }
}
