// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['fullName'] as String,
      private: json['private'] as bool);
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'private': instance.private
    };

NotificationSubject _$NotificationSubjectFromJson(Map<String, dynamic> json) {
  return NotificationSubject(
      title: json['title'] as String,
      url: json['url'] as String,
      type: json['type'] as String);
}

Map<String, dynamic> _$NotificationSubjectToJson(
        NotificationSubject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'type': instance.type
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
      id: json['id'] as String,
      repository: json['repository'] == null
          ? null
          : Repository.fromJson(json['repository'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : NotificationSubject.fromJson(
              json['subject'] as Map<String, dynamic>),
      unread: json['unread'] as bool);
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repository': instance.repository,
      'subject': instance.subject,
      'unread': instance.unread
    };
