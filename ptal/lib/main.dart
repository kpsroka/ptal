import 'package:flutter/material.dart';
import 'package:ptal/login_form.dart';
import 'package:ptal/notification_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PTAL',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new Root(title: 'PTAL', child: LoginForm()),
      routes: {
        '/notifications': (context) => new Root(title: 'Notifications', child: NotificationList())
      },
    );
  }
}

class Root extends StatelessWidget {
  final String title;
  final Widget child;

  const Root({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: child,
      ),
    );
  }
}
