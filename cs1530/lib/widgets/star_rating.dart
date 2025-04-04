// this displays the star rating system that a user uses when rating a album

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_flutter/viewmodels/rating_view_model.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar(),
              SizedBox(height: 20),
              RatingDisplay(),
            ],
          ),
    );
  }
}

class RatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
      final ratingProvider = Provider.of<RatingProvider>(context, listen: false);
      ratingProvider.updateRating(0);  // set the initial value to 0
    });

    return Consumer<RatingProvider>(
      builder: (context, ratingProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                ratingProvider.updateRating(index + 1);
              },
              child: Icon(
                index < ratingProvider.rating ? Icons.star : Icons.star_border,
                color: Colors.yellow,
                size: 40,
              ),
            );
          }),
        );
      },
    );
  }
}

class RatingDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RatingProvider>(
      builder: (context, ratingProvider, child) {
        return Text(
          'Rating: ${ratingProvider.rating}',
          style: TextStyle(fontSize: 24),
        );
      },
    );
  }
}