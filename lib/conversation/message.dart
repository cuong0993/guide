import 'package:freezed_annotation/freezed_annotation.dart';

import '../server_date_time_converter.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message(
      {required String userName,
      required String userId,
      required String userPhotoUrl,
      required String text,
      @ServerDateTimeConverter() required DateTime createdDate,
      required String id}) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
