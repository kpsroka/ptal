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
      type: _$enumDecodeNullable(
              _$NotificationSubjectTypeEnumMap, json['type']) ??
          NotificationSubjectType.Unknown);
}

Map<String, dynamic> _$NotificationSubjectToJson(
        NotificationSubject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'type': _$NotificationSubjectTypeEnumMap[instance.type]
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$NotificationSubjectTypeEnumMap = <NotificationSubjectType, dynamic>{
  NotificationSubjectType.Commit: 'Commit',
  NotificationSubjectType.Issue: 'Issue',
  NotificationSubjectType.PullRequest: 'PullRequest',
  NotificationSubjectType.Release: 'Release',
  NotificationSubjectType.RepositoryInvitation: 'RepositoryInvitation',
  NotificationSubjectType.Unknown: 'Unknown'
};

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
      id: json['id'] as String,
      reason: _$enumDecodeNullable(_$NotificationReasonEnumMap, json['reason']),
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
      'reason': _$NotificationReasonEnumMap[instance.reason],
      'subject': instance.subject,
      'unread': instance.unread
    };

const _$NotificationReasonEnumMap = <NotificationReason, dynamic>{
  NotificationReason.AssignedToIssue: 'assign',
  NotificationReason.CreatedThread: 'author',
  NotificationReason.CommentedOnThread: 'comment',
  NotificationReason.AcceptedRepositoryInvitation: 'invitation',
  NotificationReason.SubscribedManually: 'manual',
  NotificationReason.Mentioned: 'mention',
  NotificationReason.ReviewRequested: 'review_requested',
  NotificationReason.ChangedThreadState: 'state_change',
  NotificationReason.WatchingRepository: 'subscribed',
  NotificationReason.OnMentionedTeam: 'team_mention'
};
