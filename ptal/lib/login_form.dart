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

  GithubStore githubStore;

  @override
  void initState() {
    super.initState();
    githubStore = listenToStore(githubStoreToken);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 4.0),
            child: TextField(
                enabled: githubStore?.loading != true,
                controller: usernameInputController,
                decoration: InputDecoration.collapsed(hintText: 'Username')),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 4.0),
            child: TextField(
                enabled: githubStore?.loading != true,
                controller: passwordInputController,
                obscureText: true,
                decoration: InputDecoration.collapsed(hintText: 'Token')),
          ),
          RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Log in to'),
                  SizedBox(
                      width: Theme.of(context).textTheme.button.fontSize / 4),
                  Image.asset('assets/GitHub_Logo.png',
                      height: Theme.of(context).textTheme.button.fontSize),
                ],
              ),
              onPressed: githubStore?.loading == true
                  ? null
                  : () {
                      loginAction(LoginData(
                          login: usernameInputController.text,
                          password: passwordInputController.text,
                          otp: ''));
                    }),
        ],
      ),
    );
  }
}
