// this is the main review page-- when using navigation bar to navigate
// to review page this is the page you land on
// shows what album user and their friends have reviewed

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/constants.dart';
import 'package:mvvm_flutter/widgets/review_card.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton.icon(
        // if Review Music button at top of page is clicked, go to review_details_page.dart
          onPressed: () => Navigator.pushNamed(context, '/add_review'),
          icon: Icon(Icons.add),
          label: Text("Review Music"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10),
          )),
      Text('Your Reviews',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
      Visibility(
        // users_ratings from database
        // shows up if user has not made any reviews
          visible: users_ratings.isEmpty,
          child: SizedBox(
            height: 50,
            child: Text("You have no reviews"),
          )),
      // shows all of user's reviews
      Visibility(
        visible: users_ratings.isNotEmpty,
        child: SizedBox(
          height: 200,
          child: ListView.builder(
              itemCount: users_ratings.length,
              itemBuilder: (context, index) {
                final map = users_ratings[index];
                final key = map.keys.first;
                final value = map[key]!;

                int index2 = users_reviews.indexWhere((map) => map.containsKey(key));

                // user can submit rating without writing a review
                String? value2;
                if (index2 != -1) {
                  final map2 = users_reviews[index2];
                  final key2 = map2.keys.first;
                  value2 = map2[key]!;
                }

                String stars = '★' * value;

                // from review_card.dart
                return buildCard("$key: $stars", value2);
              }),
        ),
      ),
      // shows all of friends reviews
      Text('Friends\' Reviews',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
      Visibility(
        // friends from database
        visible: friends.isEmpty,
        child: Text("You have no friends"),
      ),
      Expanded(
          child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                final key = friends[index];
                var list;
                var list2;

                // friends_ratings from database
                for (var item in friends_ratings) {
                  if (item[key] != null) {
                    list = item[key];
                    break;
                  }
                }
                // friends_reviews from database
                for (var item in friends_reviews) {
                  if (item[key] != null) {
                    list2 = item[key];
                    break;
                  }
                }
                return Flex(
                  direction: Axis.vertical,
                  children: [
                    Text('$key\'s Reviews', style: TextStyle(fontSize: 25)),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final map = list[index];
                            final key = map.keys.first;
                            final value = map[key]!;

                            final map2 = list2[index];
                            final key2 = map2.keys.first;
                            final value2 = map2[key2]!;

                            String stars = '★' * value;

                            // from review_card.dart
                            return buildCard("$key: $stars", "$value2");
                          }),
                    ),
                  ],
                );
              })),
    ]);
  }
}
