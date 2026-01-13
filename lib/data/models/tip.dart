/// Daily tip model
class DailyTip {
  final String id;
  final Map<String, String> title;
  final Map<String, String> content;
  final String? imageUrl;
  final bool isActive;
  final DateTime? createdAt;

  const DailyTip({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    this.isActive = true,
    this.createdAt,
  });

  factory DailyTip.fromJson(Map<String, dynamic> json) {
    return DailyTip(
      id: json['id'] as String,
      title: _parseJsonbMap(json['title']),
      content: _parseJsonbMap(json['content']),
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  static Map<String, String> _parseJsonbMap(dynamic value) {
    if (value == null) return {};
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), v.toString()));
    }
    return {};
  }

  /// Get localized title
  String getTitle(String locale) => title[locale] ?? title['fr'] ?? '';

  /// Get localized content
  String getContent(String locale) => content[locale] ?? content['fr'] ?? '';
}
