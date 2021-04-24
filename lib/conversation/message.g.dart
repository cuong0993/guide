// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    userName: json['userName'] as String,
    userId: json['userId'] as String,
    userPhotoUrl: json['userPhotoUrl'] as String,
    text: json['text'] as String,
    createdDate:
        const ServerDateTimeConverter().fromJson(json['createdDate'] as Object),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'userPhotoUrl': instance.userPhotoUrl,
      'text': instance.text,
      'createdDate':
          const ServerDateTimeConverter().toJson(instance.createdDate),
      'id': instance.id,
    };
