// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$_$_LikeFromJson(Map<String, dynamic> json) {
  return _$_Like(
    userName: json['userName'] as String,
    userId: json['userId'] as String,
    userPhotoUrl: json['userPhotoUrl'] as String,
    createdDate:
        const ServerDateTimeConverter().fromJson(json['createdDate'] as Object),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$_$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'userPhotoUrl': instance.userPhotoUrl,
      'createdDate':
          const ServerDateTimeConverter().toJson(instance.createdDate),
      'id': instance.id,
    };
