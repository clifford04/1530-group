// this displays the chat page that contains all the chats with user's friends
// user can click on a particular friend to chat with that friend (chat_page.dart)

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/views/chat_page.dart';
import 'package:mvvm_flutter/constants.dart';

class ChatScreen extends StatelessWidget {
  final List<String> people = friends; // friends is from database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: people.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              people[index],
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // navigate to the chat screen for the selected person
              Navigator.push(
                context,
                MaterialPageRoute(
                  // chat_page.dart for specific friend
                  builder: (context) => ChatsPage(personName: people[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}