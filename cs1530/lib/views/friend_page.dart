// displays the friends page
// handles for when user decides to follow another user

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/friends_view_model.dart';
import 'package:mvvm_flutter/constants.dart';

// CONNOR

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  // from friends_view_model.dart
  final FriendsViewModel viewModel = FriendsViewModel();

  @override
  Widget build(BuildContext context) {
    final friend = viewModel.getCurrentFriend();

    // shows up when user has scrolled through all potential friends
    if (friend == null) {
      return Center(child: Text('No new friends available.'));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Friends')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // profile picture and name
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/friend.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${friend.name}, ${friend.age}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // favorite albums
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fav Albums',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(friend.favoriteAlbums.length,
                              (index) {
                            return Image.asset(
                              friend.favoriteAlbums[index],
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.25,
                              fit: BoxFit.cover,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // About Me
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.grey[200],
                          child: Text(
                            friend.bio,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Buttons
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // back button to move to previous friend
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined,
                      color: viewModel.currentIndex > 0
                          ? Colors.black
                          : Colors.grey),
                  onPressed: viewModel.currentIndex > 0
                      ? () {
                          setState(() {
                            viewModel.moveToPreviousFriend();
                          });
                        }
                      : null,
                ),
                ElevatedButton(
                  // friend or unfriend button (toggles depending on status)
                  onPressed: () {
                    setState(() {
                      friend.togglePressedStatus();
                      // adding or removing a friend depending on which button hit
                      friend.pressed
                          // friends from database
                          ? friends.add(friend.name)
                          : friends.remove(friend.name);
                    });
                  },
                  // button has different color and text depending on what it does
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        friend.pressed ? Colors.redAccent : Colors.greenAccent,
                  ),
                  child: Text(friend.pressed ? 'Unfriend' : 'Add Friend!'),
                ),
                // next button to move to next friend
                IconButton(
                  icon: Icon(Icons.arrow_forward_outlined, color: Colors.pink),
                  onPressed: () {
                    setState(() {
                      viewModel.moveToNextFriend();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
