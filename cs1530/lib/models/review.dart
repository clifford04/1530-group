// class of reviews-- this is created when a user creates a review

class Review {
  final String id;
  final int rating;

  Review({required this.id, required this.rating});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
    };
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json["id"],
      rating: json["rating"],
    );
  }
}