import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../timestamp_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User(
      {required String id,
      required String name,
      required String photoUrl,
      required List<String> tokens,
      @TimestampConverter() required DateTime creationTime}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
