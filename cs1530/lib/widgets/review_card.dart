// on review_page.dart, each review that a user and their friends make is on a
// "card", and this code creates that widget and styles it

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(String title, String? text) {
  return Card(
    elevation: 4, // gives the card a shadow effect
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // rounded corners for the card
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title of the card
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // space between the title and text
          // text under the title
          // left blank if no review was written
          Text(
            text ?? '',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54, // lighter color for the text
            ),
          ),
        ],
      ),
    ),
  );
}
