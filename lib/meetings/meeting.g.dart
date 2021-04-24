// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meeting _$_$_MeetingFromJson(Map<String, dynamic> json) {
  return _$_Meeting(
    participantIds: Map<String, bool>.from(json['participantIds'] as Map),
    participantNames: Map<String, String>.from(json['participantNames'] as Map),
    participantUrls: Map<String, String>.from(json['participantUrls'] as Map),
    id: json['id'] as String,
    name: json['name'] as String,
    time: const TimestampConverter().fromJson(json['time'] as Timestamp),
    createdUserId: json['createdUserId'] as String,
    participantCount: json['participantCount'] as int,
  );
}

Map<String, dynamic> _$_$_MeetingToJson(_$_Meeting instance) =>
    <String, dynamic>{
      'participantIds': instance.participantIds,
      'participantNames': instance.participantNames,
      'participantUrls': instance.participantUrls,
      'id': instance.id,
      'name': instance.name,
      'time': const TimestampConverter().toJson(instance.time),
      'createdUserId': instance.createdUserId,
      'participantCount': instance.participantCount,
    };
