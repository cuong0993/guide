// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    userName: json['userName'] as String,
    userId: json['userId'] as String,
    userPhotoUrl: json['userPhotoUrl'] as String,
    text: json['text'] as String,
    name: json['name'] as String,
    commentCount: json['commentCount'] as int? ?? 0,
    likedUserIds: (json['likedUserIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    createdDate:
        const ServerDateTimeConverter().fromJson(json['createdDate'] as Object),
    timeSlots: (json['timeSlots'] as List<dynamic>)
        .map((e) => const TimestampConverter().fromJson(e as Timestamp))
        .toList(),
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    id: json['id'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'userPhotoUrl': instance.userPhotoUrl,
      'text': instance.text,
      'name': instance.name,
      'commentCount': instance.commentCount,
      'likedUserIds': instance.likedUserIds,
      'tags': instance.tags,
      'createdDate':
          const ServerDateTimeConverter().toJson(instance.createdDate),
      'timeSlots':
          instance.timeSlots.map(const TimestampConverter().toJson).toList(),
      'images': instance.images,
      'id': instance.id,
    };
