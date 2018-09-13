import 'package:flutter/material.dart';
import 'input.dart';
import 'msg.dart';

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

class ChatState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMsg> _messages = new List();

  @override
    void dispose() {
      for (ChatMsg msg in _messages) {
        msg.animationController.dispose();
      }
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text("Friendlychat")),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          itemBuilder: (context, index) => _messages[index],
          itemCount: _messages.length,
          reverse: true,
        )),
        Divider(),
        new ChatInput(onMessageSent: (text) {
          print('Adding: ' + text);
          setState(() {
            final ChatMsg chatMsg = new ChatMsg(
                text,
                AnimationController(
                    vsync: this, duration: Duration(milliseconds: 750)));
            _messages.add(chatMsg);
            chatMsg.animationController.forward();
          });
        })
      ]),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatState();
}
