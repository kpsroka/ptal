import 'package:flutter/material.dart';
import 'input.dart';

void main() {
  runApp(new FriendlychatApp());
}


class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new ChatInput(),
    );
  }
}
