import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../server_date_time_converter.dart';
import '../timestamp_converter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String userName,
    required String userId,
    required String userPhotoUrl,
    required String text,
    required String name,
    @Default(0) int commentCount,
    @Default(<String>[]) List<String> likedUserIds,
    required List<String> tags,
    @ServerDateTimeConverter() required DateTime createdDate,
    @TimestampConverter() required List<DateTime> timeSlots,
    required List<String> images,
    @Default('') String id,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
