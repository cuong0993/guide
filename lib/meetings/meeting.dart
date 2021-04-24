import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../timestamp_converter.dart';

part 'meeting.freezed.dart';
part 'meeting.g.dart';

@freezed
class Meeting with _$Meeting {
  factory Meeting({
    required Map<String, bool> participantIds,
    required Map<String, String> participantNames,
    required Map<String, String> participantUrls,
    required String id,
    required String name,
    @TimestampConverter() required DateTime time,
    required String createdUserId,
    required int participantCount,
  }) = _Meeting;

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);
}
