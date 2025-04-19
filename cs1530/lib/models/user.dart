// class of users

class User {
  final int id;
  final List<dynamic> reviews;

  User({required this.id, required this.reviews});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      reviews: json["review_ids"],
    );
  }
}
