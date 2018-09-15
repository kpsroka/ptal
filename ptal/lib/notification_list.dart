import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:ptal/stores/github_store.dart';

class NotificationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotificationListState();
}

class NotificationListState extends State<NotificationList>
    with StoreWatcherMixin<NotificationList> {
  GitHubStore githubStore;

  @override
  void initState() {
    super.initState();
    githubStore = listenToStore(githubStoreToken);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: githubStore?.notifications?.length ?? 0,
        itemBuilder: (context, index) {
          final item = githubStore.notifications[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.startToEnd,
            onDismissed: (_) {
              removeAction(item.id);
            },
            child: ListTile(
                title: Text(
              item.subject.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
          );
        });
  }
}
