import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ServerDateTimeConverter implements JsonConverter<DateTime, Object> {
  const ServerDateTimeConverter();

  @override
  DateTime fromJson(Object json) {
    return (json as Timestamp).toDate();
  }

  @override
  Object toJson(Object object) => FieldValue.serverTimestamp();
}
