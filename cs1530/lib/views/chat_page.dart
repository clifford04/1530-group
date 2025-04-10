// this displays an individual chat with a friend

import 'package:flutter/material.dart';
import 'package:mvvm_flutter/viewmodels/chat_view_model.dart';
import 'package:provider/provider.dart';

class ChatsPage extends StatelessWidget {
  final String personName;

  ChatsPage({required this.personName});

  final TextEditingController _controller = TextEditingController();

  void _sendMessage(BuildContext context) {
    if (_controller.text.trim().isEmpty) return;

    // from chat_view_model.dart
    Provider.of<ChatProvider>(context, listen: false)
        .sendMessage(personName, _controller.text);

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personName),
      ),
      body: Column(
        children: [
          Expanded(
            // provider from chat_view_model.dart
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                // function from chat_view_model.dart
                final messages = chatProvider.getMessages(personName);
                return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: messages[index].startsWith("Friend's reply")
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: messages[index].startsWith("Friend's reply")
                              ? Colors.grey[300]
                              : Colors.blue[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(messages[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a message',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(context),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
