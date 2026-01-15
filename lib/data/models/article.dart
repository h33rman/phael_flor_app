/// Article Model (Tips & Blog)
class Article {
  final String id;
  final String title;
  final String? excerpt;
  final String? content; // HTML content
  final String category; // 'tip', 'article', 'promotion'
  final List<String> tags;
  final String? featureImageUrl;
  final DateTime? publishedAt;
  final List<String> relatedProductIds;

  const Article({
    required this.id,
    required this.title,
    this.excerpt,
    this.content,
    required this.category,
    this.tags = const [],
    this.featureImageUrl,
    this.publishedAt,
    this.relatedProductIds = const [],
  });
}
