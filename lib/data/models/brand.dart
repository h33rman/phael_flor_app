/// Brand model representing Phael Flor, Actiflora, or Florentine
class Brand {
  final String id;
  final String name;
  final String? logoUrl;
  final Map<String, String>? description; // {"fr": "...", "en": "..."}
  final DateTime? createdAt;

  const Brand({
    required this.id,
    required this.name,
    this.logoUrl,
    this.description,
    this.createdAt,
  });

  /// Get localized description
  String getLocalizedDescription(String languageCode) {
    return description?[languageCode] ?? description?['en'] ?? '';
  }

  /// Create from Supabase JSON
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] as String,
      name: json['name'] as String,
      logoUrl: json['logo_url'] as String?,
      description: json['description'] != null
          ? Map<String, String>.from(json['description'] as Map)
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo_url': logoUrl,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  Brand copyWith({
    String? id,
    String? name,
    String? logoUrl,
    Map<String, String>? description,
    DateTime? createdAt,
  }) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
