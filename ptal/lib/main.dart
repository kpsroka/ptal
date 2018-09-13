import 'package:flutter/material.dart';
import 'package:ptal/stores/github_store.dart';
import 'package:flutter_flux/flutter_flux.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'PTAL',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new MyHomePage(title: 'PTAL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with StoreWatcherMixin<MyHomePage> {
  final usernameInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
    void initState() {
      super.initState();
      listenToStore(githubStoreToken);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                controller: usernameInputController,
                decoration: InputDecoration.collapsed(hintText: 'Username')),
            TextField(
                controller: passwordInputController,
                obscureText: true,
                decoration: InputDecoration.collapsed(hintText: 'Token')),
            RaisedButton(
                child: Text('Log in'),
                onPressed: () {
                  print('yes please');
                  loginAction(LoginData(
                      login: usernameInputController.text,
                      password: passwordInputController.text,
                      otp: ''));
                }),
          ],
        ),
      ),
    );
  }
}
