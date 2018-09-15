import 'dart:convert';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:http/http.dart' as http;
import 'package:ptal/api/login_data.dart';
import 'package:ptal/api/model/notification.dart';

final Action<LoginData> loginAction = new Action<LoginData>();

class GithubStore extends Store {
  final List<Notification> _notifications = <Notification>[];
  List<Notification> get notifications =>
      new List<Notification>.unmodifiable(_notifications);

  bool _loading = false;
  bool get loading => _loading;

  GithubStore() {
    print('GithubStore()');
    triggerOnAction(loginAction, _handleLoginAction);
  }

  void _handleLoginAction(LoginData loginData) async {
    print('_handleLoginAction');
    if (_loading) {
      return;
    }

    _loading = true;
    _notifications.clear();
    trigger();

    try {
      final String basicAuth = 'Basic ' +
          base64Encode(utf8.encode(loginData.login + ':' + loginData.password));

      http.Response response =
          await http.get('https://api.github.com/notifications', headers: {
        'authorization': basicAuth,
      });

      if (response.statusCode == 200) {
        final List<dynamic> notifications = json.decode(response.body);
        for (Map<String, dynamic> notificationJson in notifications) {
          final notification = Notification.fromJson(notificationJson);
          _notifications.add(notification);
        }
        print('Loaded ' + _notifications.length.toString() + ' notifications');
      }
    } finally {
      _loading = false;
    }
  }
}

StoreToken githubStoreToken = StoreToken(new GithubStore());
