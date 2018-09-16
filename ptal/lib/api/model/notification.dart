import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';

@JsonSerializable()
class Repository {
  final int id;
  final String name;
  final String fullName;
  final bool private;
  Repository(
      {@required this.id,
      @required this.name,
      @required this.fullName,
      @required this.private});

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}

enum NotificationReason {
  @JsonValue('assign') AssignedToIssue,
  @JsonValue('author') CreatedThread,
  @JsonValue('comment') CommentedOnThread,
  @JsonValue('invitation') AcceptedRepositoryInvitation,
  @JsonValue('manual') SubscribedManually,
  @JsonValue('mention') Mentioned,
  @JsonValue('review_requested') ReviewRequested,
  @JsonValue('state_change') ChangedThreadState,
  @JsonValue('subscribed') WatchingRepository,
  @JsonValue('team_mention') OnMentionedTeam
}

enum NotificationSubjectType {
  Commit,
  Issue,
  PullRequest,
  Release,
  RepositoryInvitation,
  Unknown,
}

@JsonSerializable()
class NotificationSubject {
  final String title;
  final String url;
  @JsonKey(defaultValue: NotificationSubjectType.Unknown)
  final NotificationSubjectType type;
  NotificationSubject({this.title, this.url, this.type});

  factory NotificationSubject.fromJson(Map<String, dynamic> json) =>
      _$NotificationSubjectFromJson(json);
}

@JsonSerializable()
class Notification {
  final String id;
  final Repository repository;
  @JsonKey(nullable: true)
  final NotificationReason reason;
  final NotificationSubject subject;
  final bool unread;
  Notification( 
      {@required this.id,
      this.reason,
      @required this.repository,
      @required this.subject,
      @required this.unread});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
