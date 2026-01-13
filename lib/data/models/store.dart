/// Store model for partner retail locations
class Store {
  final String id;
  final String name;
  final String? address;
  final String? city;
  final String? region;
  final String? phone;
  final String? email;
  final String? imageUrl;
  final bool isActive;

  const Store({
    required this.id,
    required this.name,
    this.address,
    this.city,
    this.region,
    this.phone,
    this.email,
    this.imageUrl,
    this.isActive = true,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'city': city,
    'region': region,
    'phone': phone,
    'email': email,
    'image_url': imageUrl,
    'is_active': isActive,
  };

  /// Get full address string
  String get fullAddress {
    final parts = <String>[];
    if (address != null) parts.add(address!);
    if (city != null) parts.add(city!);
    if (region != null) parts.add(region!);
    return parts.join(', ');
  }

  /// Google Maps URL for directions
  String get googleMapsUrl {
    final query = Uri.encodeComponent(
      fullAddress.isNotEmpty ? fullAddress : name,
    );
    return 'https://www.google.com/maps/search/?api=1&query=$query';
  }
}
