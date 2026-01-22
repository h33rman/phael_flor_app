import 'enums.dart';
import 'usage_section.dart';

/// Product model with 3 sections:
/// 1. Physical Characteristics (name, form, category, etc.)
/// 2. About Details (tags, bienfaits)
/// 3. Usage (accordion sections)
class Product {
  final String id;
  final String brandId;

  // ═══════════════════════════════════════════════════════════════
  // SECTION 1: Physical Characteristics
  // ═══════════════════════════════════════════════════════════════
  final Map<String, String>
  name; // {"fr": "Basilic Bio", "en": "Organic Basil"}
  final String? scientificName;
  final ProductForm? form;
  final String? formSlug; // Keep internal reference if needed
  final String categorySlug;
  final String? weightVolume; // Combined for legacy/simple display
  final String? weight;
  final String? volume;
  final List<String>? ingredients;
  final List<String>? certifications;

  // Images
  final String? imageUrl;
  final List<String>? galleryUrls;

  // ═══════════════════════════════════════════════════════════════
  // SECTION 2: About Details
  // ═══════════════════════════════════════════════════════════════
  final List<String>? tags; // ["relaxant", "digestif", "sommeil"]
  final Map<String, List<String>>?
  bienfaits; // {"fr": ["Point 1"], "en": [...]}

  // ═══════════════════════════════════════════════════════════════
  // SECTION 3: Usage (Accordion)
  // ═══════════════════════════════════════════════════════════════
  final List<UsageSection>? usages;
  final Map<String, String>? excerpt; // {"fr": "Short summary", "en": "..."}

  // Meta
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Product({
    required this.id,
    required this.brandId,
    required this.name,
    required this.categorySlug,
    this.scientificName,
    this.form,
    this.formSlug,
    this.weightVolume,
    this.weight,
    this.volume,
    this.ingredients,
    this.certifications,
    this.imageUrl,
    this.galleryUrls,
    this.tags,
    this.bienfaits,
    this.usages,
    this.excerpt,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  /// Get localized name based on language code
  String getLocalizedName(String languageCode) {
    return name[languageCode] ?? name['en'] ?? name.values.first;
  }

  /// Get localized bienfaits based on language code
  List<String> getLocalizedBienfaits(String languageCode) {
    return bienfaits?[languageCode] ?? bienfaits?['en'] ?? [];
  }

  /// Create from Supabase JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      brandId: json['brand_id'] as String,
      name: Map<String, String>.from(json['name'] as Map),
      scientificName: json['scientific_name'] as String?,
      form: ProductForm.fromString(json['form'] as String?),
      formSlug: json['form'] as String?,
      categorySlug: json['category'] as String? ?? 'unknown',
      weightVolume: json['weight_volume'] as String?,
      weight: json['weight'] as String?,
      volume: json['volume'] as String?,
      ingredients: json['ingredients'] != null
          ? List<String>.from(json['ingredients'] as List)
          : null,
      certifications: json['certifications'] != null
          ? List<String>.from(json['certifications'] as List)
          : null,
      imageUrl: json['image_url'] as String?,
      galleryUrls: json['gallery_urls'] != null
          ? List<String>.from(json['gallery_urls'] as List)
          : null,
      tags: json['tags'] != null
          ? List<String>.from(json['tags'] as List)
          : null,
      bienfaits: json['bienfaits'] != null
          ? (json['bienfaits'] as Map).map(
              (k, v) => MapEntry(k as String, List<String>.from(v as List)),
            )
          : null,
      usages: json['usages'] != null
          ? (json['usages'] as List)
                .map((e) => UsageSection.fromJson(e as Map<String, dynamic>))
                .toList()
          : null,
      excerpt: json['excerpt'] != null
          ? Map<String, String>.from(json['excerpt'] as Map)
          : null,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand_id': brandId,
      'name': name,
      'scientific_name': scientificName,
      'form': form?.labelKey,
      'category': categorySlug,
      'weight_volume': weightVolume,
      'weight': weight,
      'volume': volume,
      'ingredients': ingredients,
      'certifications': certifications,
      'image_url': imageUrl,
      'gallery_urls': galleryUrls,
      'tags': tags,
      'bienfaits': bienfaits,
      'usages': usages?.map((e) => e.toJson()).toList(),
      'excerpt': excerpt,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  Product copyWith({
    String? id,
    String? brandId,
    Map<String, String>? name,
    String? scientificName,
    ProductForm? form,
    String? formSlug,
    String? categorySlug,
    String? weightVolume,
    String? weight,
    String? volume,
    List<String>? ingredients,
    List<String>? certifications,
    String? imageUrl,
    List<String>? galleryUrls,
    List<String>? tags,
    Map<String, List<String>>? bienfaits,
    List<UsageSection>? usages,
    Map<String, String>? excerpt,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      name: name ?? this.name,
      scientificName: scientificName ?? this.scientificName,
      form: form ?? this.form,
      formSlug: formSlug ?? this.formSlug,
      categorySlug: categorySlug ?? this.categorySlug,
      weightVolume: weightVolume ?? this.weightVolume,
      weight: weight ?? this.weight,
      volume: volume ?? this.volume,
      ingredients: ingredients ?? this.ingredients,
      certifications: certifications ?? this.certifications,
      imageUrl: imageUrl ?? this.imageUrl,
      galleryUrls: galleryUrls ?? this.galleryUrls,
      tags: tags ?? this.tags,
      bienfaits: bienfaits ?? this.bienfaits,
      usages: usages ?? this.usages,
      excerpt: excerpt ?? this.excerpt,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
