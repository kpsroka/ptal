import 'package:flutter/material.dart';
import 'package:ptal/login_form.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PTAL',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new Root(title: 'PTAL'),
    );
  }
}

class Root extends StatelessWidget {
  final String title;

  const Root({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        child: LoginForm(),
      ),
    );
  }
}
