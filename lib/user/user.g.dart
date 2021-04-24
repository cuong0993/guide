// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
    tokens: (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
    creationTime:
        const TimestampConverter().fromJson(json['creationTime'] as Timestamp),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'tokens': instance.tokens,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
    };
