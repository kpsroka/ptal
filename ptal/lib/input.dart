import 'package:flutter/material.dart';

class ChatState extends State<ChatInput> {
  final TextEditingController _chatController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: [
          new Flexible(
              child: new TextField(
            controller: _chatController,
            onChanged: (_ignored) {
              setState(() {}); // Trigger state to update IconButton's onPress
            },
            decoration: new InputDecoration.collapsed(hintText: 'Bella ciao!'),
          )),
          new Container(
              margin: new EdgeInsets.only(left: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: _chatController.text.length > 0
                    ? () {
                        print('pressed: ' + _chatController.text);
                        _chatController.clear();
                      }
                    : null,
              ))
        ]));
  }
}

class ChatInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatState();
}
