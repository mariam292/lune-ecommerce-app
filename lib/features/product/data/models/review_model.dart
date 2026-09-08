class GetReviewModel {
  final String comment;
  final int rating;
  final DateTime createdAt;
  final String userName;

  GetReviewModel({
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.userName,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) {
    return GetReviewModel(
      comment: json['comment'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['createdAt']),
      userName: json['userName'],
    );
  }
}

class PostReviewModel {
  final String productId, comment;
  PostReviewModel({required this.productId, required this.comment});

  factory GetReviewModel.fromJson(Map<String, dynamic> json) {
    return GetReviewModel(
      comment: json['comment'],
      rating: json['rating'],
      createdAt: DateTime.parse(json['createdAt']),
      userName: json['userName'],
    );
  }
}
