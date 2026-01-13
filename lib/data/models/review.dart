/// Review model for product ratings and comments
class Review {
  final String id;
  final String userId;
  final String productId;
  final int rating;
  final String? comment;
  final DateTime? createdAt;
  final String? userName; // From join

  const Review({
    required this.id,
    required this.userId,
    required this.productId,
    required this.rating,
    this.comment,
    this.createdAt,
    this.userName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      productId: json['product_id'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      userName: json['user_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'product_id': productId,
    'rating': rating,
    'comment': comment,
  };
}
