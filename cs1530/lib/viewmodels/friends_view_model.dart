// view model for following friends on friend page

// OLIVIA

import 'package:mvvm_flutter/models/friends.dart';
import 'package:mvvm_flutter/constants.dart';

class FriendsViewModel {
  final List<Friend> friends;

  // friendsVM is from database
  FriendsViewModel() : friends = friendsVM;

  // curIndex from database
  int currentIndex = curIndex;

  Friend? getCurrentFriend() {
    if (currentIndex >= 0 && currentIndex < friends.length) {
      return friends[currentIndex];
    }
    return null;
  }

  void moveToNextFriend() {
    if (currentIndex < friends.length - 1) {
      currentIndex++;
      curIndex++; // updating database
    }
  }

  void moveToPreviousFriend() {
    if (currentIndex > 0) {
      currentIndex--;
      curIndex--; // updating database
    }
  }
}