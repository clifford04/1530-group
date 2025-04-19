// when a user rates a album, this allows access to the value
// associated with the rating (aka number of stars)

import 'package:flutter/material.dart';

// RatingProvider to manage the rating globally
class RatingProvider extends ChangeNotifier {
  int _rating = 0;

  int get rating => _rating;

  // when rating a song, value is initially 0 stars
  init() {
    _rating = 0;
  }

  void updateRating(int newRating) {
    _rating = newRating;
    notifyListeners();
  }
}
