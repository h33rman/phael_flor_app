/// A single usage section for the accordion display
class UsageSection {
  final Map<String, String> title; // {"fr": "En cuisine", "en": "In cooking"}
  final Map<String, String> content; // {"fr": "...", "en": "..."}
  final String? icon; // Optional icon name

  const UsageSection({required this.title, required this.content, this.icon});

  /// Get localized title
  String getLocalizedTitle(String languageCode) {
    return title[languageCode] ?? title['en'] ?? title.values.first;
  }

  /// Get localized content
  String getLocalizedContent(String languageCode) {
    return content[languageCode] ?? content['en'] ?? content.values.first;
  }

  factory UsageSection.fromJson(Map<String, dynamic> json) {
    return UsageSection(
      title: Map<String, String>.from(json['title'] as Map),
      content: Map<String, String>.from(json['content'] as Map),
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content, 'icon': icon};
  }
}
