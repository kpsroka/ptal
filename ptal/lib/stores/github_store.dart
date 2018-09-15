import 'package:flutter_flux/flutter_flux.dart';
import 'package:ptal/api/api.dart';
import 'package:ptal/api/login_data.dart';
import 'package:ptal/api/model/notification.dart';

final Action<LoginData> loginAction = new Action<LoginData>();
final Action<String> removeAction = new Action<String>();

class GitHubStore extends Store {
  final List<Notification> _notifications = <Notification>[];
  final GitHubApi gitHubApi = new GitHubApi();

  List<Notification> get notifications =>
      new List<Notification>.unmodifiable(_notifications);

  bool _loading = false;
  bool get loading => _loading;

  GitHubStore() {
    print('GithubStore()');
    triggerOnAction(loginAction, _handleLoginAction);
    triggerOnAction(removeAction, _handleRemoveAction);
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
      _notifications.addAll(await gitHubApi.fetchNotifications(loginData));
    } catch (e) {
      print("Exception in GitHubClient: ${e.toString()}");
    } finally {
      _loading = false;
    }
  }

  void _handleRemoveAction(String threadId) async {
    print('_handleRemoveAction');

    try {
      await gitHubApi.markThreadAsRead(threadId);
      _notifications.removeWhere((n) => n.id == threadId);
    } catch (e) {
      print("Exception in GitHubClient: ${e.toString()}");
    }
  }
}

StoreToken githubStoreToken = StoreToken(new GitHubStore());
