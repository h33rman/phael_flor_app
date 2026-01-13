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
  final ProductCategory? category;
  final String? weightVolume;
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

  // Meta
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Product({
    required this.id,
    required this.brandId,
    required this.name,
    this.scientificName,
    this.form,
    this.category,
    this.weightVolume,
    this.ingredients,
    this.certifications,
    this.imageUrl,
    this.galleryUrls,
    this.tags,
    this.bienfaits,
    this.usages,
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
      category: ProductCategory.fromString(json['category'] as String?),
      weightVolume: json['weight_volume'] as String?,
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
      'category': category?.labelKey,
      'weight_volume': weightVolume,
      'ingredients': ingredients,
      'certifications': certifications,
      'image_url': imageUrl,
      'gallery_urls': galleryUrls,
      'tags': tags,
      'bienfaits': bienfaits,
      'usages': usages?.map((e) => e.toJson()).toList(),
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
    ProductCategory? category,
    String? weightVolume,
    List<String>? ingredients,
    List<String>? certifications,
    String? imageUrl,
    List<String>? galleryUrls,
    List<String>? tags,
    Map<String, List<String>>? bienfaits,
    List<UsageSection>? usages,
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
      category: category ?? this.category,
      weightVolume: weightVolume ?? this.weightVolume,
      ingredients: ingredients ?? this.ingredients,
      certifications: certifications ?? this.certifications,
      imageUrl: imageUrl ?? this.imageUrl,
      galleryUrls: galleryUrls ?? this.galleryUrls,
      tags: tags ?? this.tags,
      bienfaits: bienfaits ?? this.bienfaits,
      usages: usages ?? this.usages,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
