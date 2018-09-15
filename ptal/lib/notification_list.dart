import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:ptal/stores/github_store.dart';

class NotificationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotificationListState();
}

class NotificationListState extends State<NotificationList>
    with StoreWatcherMixin<NotificationList> {
  GithubStore githubStore;

  @override
  void initState() {
    super.initState();
    githubStore = listenToStore(githubStoreToken);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: githubStore?.notifications?.length ?? 0,
        itemBuilder: (context, index) => ListTile(
            key: Key(githubStore.notifications[index].id),
            title: Text(
              githubStore.notifications[index].subject.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )));
  }
}
