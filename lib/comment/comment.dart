import 'package:freezed_annotation/freezed_annotation.dart';

import '../server_date_time_converter.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment(
      {required String userName,
      required String userId,
      required String userPhotoUrl,
      required String text,
      @ServerDateTimeConverter() required DateTime createdDate,
      required String id}) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
