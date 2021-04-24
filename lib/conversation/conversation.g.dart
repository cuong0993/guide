// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$_$_ConversationFromJson(Map<String, dynamic> json) {
  return _$_Conversation(
    participantIds: Map<String, bool>.from(json['participantIds'] as Map),
    lastViews: Map<String, int>.from(json['lastViews'] as Map),
    id: json['id'] as String,
    participantCount: json['participantCount'] as int,
  );
}

Map<String, dynamic> _$_$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'participantIds': instance.participantIds,
      'lastViews': instance.lastViews,
      'id': instance.id,
      'participantCount': instance.participantCount,
    };
