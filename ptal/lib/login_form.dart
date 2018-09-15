import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:ptal/stores/github_store.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return new LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>
    with StoreWatcherMixin<LoginForm> {
  final usernameInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenToStore(githubStoreToken);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  login: widget.usernameInputController.text,
                  password: widget.passwordInputController.text,
                  otp: ''));
            }),
      ],
    );
  }
}
