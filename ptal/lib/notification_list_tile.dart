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
      dense: true,
      leading: SizedBox(
          height: 16.0,
          width: 16.0,
          child: Center(
              child: Image.asset(_subjectTypeToAssetPath(item.subject.type)))),
      title: Text(
        item.subject.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(_reasonToSubtitle(item.reason)),
    );
  }

  String _subjectTypeToAssetPath(ApiModel.NotificationSubjectType type) {
    switch (type) {
      case ApiModel.NotificationSubjectType.Commit:
        return 'assets/git-commit.png';
      case ApiModel.NotificationSubjectType.Issue:
        return 'assets/git-issue.png';
      case ApiModel.NotificationSubjectType.PullRequest:
        return 'assets/git-pull-request.png';
      case ApiModel.NotificationSubjectType.Release:
        return 'assets/git-release.png';
      case ApiModel.NotificationSubjectType.RepositoryInvitation:
        return 'assets/git-repository.png';
      default:
        return 'assets/git-unknown.png';
    }
  }

  String _reasonToSubtitle(ApiModel.NotificationReason reason) {
    switch (reason) {
      case ApiModel.NotificationReason.AcceptedRepositoryInvitation:
        return 'You accepted invitation to the repository';
      case ApiModel.NotificationReason.AssignedToIssue:
        return 'You were assigned to the issue';
      case ApiModel.NotificationReason.ChangedThreadState:
        return 'You changed the thread';
      case ApiModel.NotificationReason.CommentedOnThread:
        return 'You commented on the thread';
      case ApiModel.NotificationReason.CreatedThread:
        return 'You created the thread';
      case ApiModel.NotificationReason.Mentioned:
        return 'You were mentioned on the thread';
      case ApiModel.NotificationReason.OnMentionedTeam:
        return 'You are on the mentioned team';
      case ApiModel.NotificationReason.ReviewRequested:
        return 'Your review was requested';
      case ApiModel.NotificationReason.SubscribedManually:
        return 'You subscribed to the thread';
      case ApiModel.NotificationReason.WatchingRepository:
        return 'You are watching this repository';
      default:
        return '';
    }
  }
}
