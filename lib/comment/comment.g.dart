// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    userName: json['userName'] as String,
    userId: json['userId'] as String,
    userPhotoUrl: json['userPhotoUrl'] as String,
    text: json['text'] as String,
    createdDate:
        const ServerDateTimeConverter().fromJson(json['createdDate'] as Object),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'userPhotoUrl': instance.userPhotoUrl,
      'text': instance.text,
      'createdDate':
          const ServerDateTimeConverter().toJson(instance.createdDate),
      'id': instance.id,
    };
