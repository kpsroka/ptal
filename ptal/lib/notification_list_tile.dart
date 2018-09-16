import 'package:flutter/material.dart';
import 'package:ptal/api/model/notification.dart' as ApiModel;

class NotificationListTile extends StatelessWidget {
  final ApiModel.Notification item;
  const NotificationListTile({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
          height: 16.0,
          width: 16.0,
          child: Center(child: Image.asset(_subjectTypeToAssetPath(item.subject.type)))),
        title: Text(
          item.subject.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ));
  }

  String _subjectTypeToAssetPath(ApiModel.NotificationSubjectType type) {
    switch (type) {
      case ApiModel.NotificationSubjectType.Commit: return 'assets/git-commit.png';
      case ApiModel.NotificationSubjectType.Issue: return 'assets/git-issue.png';
      case ApiModel.NotificationSubjectType.PullRequest: return 'assets/git-pull-request.png';
      case ApiModel.NotificationSubjectType.Release: return 'assets/git-release.png';
      case ApiModel.NotificationSubjectType.RepositoryInvitation: return 'assets/git-repository.png';
      default: return 'assets/git-unknown.png';
    }
  }
}
