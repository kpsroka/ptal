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

@JsonSerializable()
class NotificationSubject {
  final String title;
  final String url;
  final String type;
  NotificationSubject({this.title, this.url, this.type});

  factory NotificationSubject.fromJson(Map<String, dynamic> json) =>
      _$NotificationSubjectFromJson(json);
}

@JsonSerializable()
class Notification {
  final String id;
  final Repository repository;
  final NotificationSubject subject;
  final bool unread;
  Notification(
      {@required this.id,
      @required this.repository,
      @required this.subject,
      @required this.unread});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
