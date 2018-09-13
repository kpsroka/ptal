import 'package:flutter/material.dart';

const String USERNAME = 'Ofca';

class ChatMsg extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const ChatMsg(this.text, this.animationController);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),

      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            CircleAvatar(child: Text(USERNAME[0])),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Text(USERNAME), Text(text)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
