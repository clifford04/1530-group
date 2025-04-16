import 'package:mvvm_flutter/models/review.dart';

class ReviewViewModel {
  final Review review;

  ReviewViewModel({required this.review});

  String get id {
    return this.review.id;
  }

  int get rating {
    return this.review.rating;
  }
}