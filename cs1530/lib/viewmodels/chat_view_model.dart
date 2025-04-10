// the view model for a chat with a friend

import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final Map<String, List<String>> _chats = {};

  Map<String, List<String>> get chats => _chats;

  // sends a message in chat and triggers bot response for user messages
  void sendMessage(String person, String message) {
    if (!_chats.containsKey(person)) {
      _chats[person] = [];
    }
    _chats[person]?.add(message);
    notifyListeners();

    // trigger a bot response
    _addBotResponse(person, message);
  }

  // returns messages with a specific friend
  List<String> getMessages(String person) {
    return _chats[person] ?? [];
  }

  // adds a bot response after a short delay
  void _addBotResponse(String person, String userMessage) {
    Future.delayed(Duration(seconds: 1), () {
      _chats[person]?.add("Friend's reply");
      notifyListeners();
    });
  }
}
