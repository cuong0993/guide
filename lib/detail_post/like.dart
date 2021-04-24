import 'package:freezed_annotation/freezed_annotation.dart';

import '../server_date_time_converter.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like {
  factory Like({
    required String userName,
    required String userId,
    required String userPhotoUrl,
    @ServerDateTimeConverter() required DateTime createdDate,
    required String id,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
