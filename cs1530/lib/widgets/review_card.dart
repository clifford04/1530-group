// on review_page.dart, each review that a user and their friends make is on a
// "card", and this code creates that widget and styles it

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(String title, String text) {
  return Card(
    elevation: 4, // Gives the card a shadow effect
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners for the card
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title of the card
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Space between the title and text
          // Text under the title
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54, // Lighter color for the text
            ),
          ),
        ],
      ),
    ),
  );
}