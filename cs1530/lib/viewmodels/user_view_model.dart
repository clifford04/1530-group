// contains getters for users
// contains code for fetching a user given its id

import 'package:mvvm_flutter/models/user.dart';

class UserViewModel {
  final User user;

  UserViewModel({required this.user});

  int get id {
    return this.user.id;
  }

  List<dynamic> get reviews {
    return this.user.reviews;
  }
}