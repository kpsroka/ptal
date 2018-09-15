import 'dart:async';
import 'dart:convert';
import 'package:ptal/api/login_data.dart';
import 'package:http/http.dart' as http;
import 'package:ptal/api/model/notification.dart';

class GitHubApi {
  static final baseUrl = 'https://api.github.com';
  static final GitHubApi _instance = new GitHubApi._create();

  factory GitHubApi() {
    return _instance;
  }

  GitHubApi._create();

  Future<List<Notification>> fetchNotifications(LoginData loginData) async {
    final String basicAuth = 'Basic ' +
        base64Encode(utf8.encode(loginData.login + ':' + loginData.password));

    http.Response response =
        await http.get("$baseUrl/notifications", headers: {
      'authorization': basicAuth,
    });

    if (response.statusCode == 200) {
      return Future.value(List.from(
          List.from(json.decode(response.body)).map(_notificationFromJson)));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  _notificationFromJson(json) => Notification.fromJson(json);
}
