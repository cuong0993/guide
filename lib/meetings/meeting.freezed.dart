// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'meeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Meeting _$MeetingFromJson(Map<String, dynamic> json) {
  return _Meeting.fromJson(json);
}

/// @nodoc
class _$MeetingTearOff {
  const _$MeetingTearOff();

  _Meeting call(
      {required Map<String, bool> participantIds,
      required Map<String, String> participantNames,
      required Map<String, String> participantUrls,
      required String id,
      required String name,
      @TimestampConverter() required DateTime time,
      required String createdUserId,
      required int participantCount}) {
    return _Meeting(
      participantIds: participantIds,
      participantNames: participantNames,
      participantUrls: participantUrls,
      id: id,
      name: name,
      time: time,
      createdUserId: createdUserId,
      participantCount: participantCount,
    );
  }

  Meeting fromJson(Map<String, Object> json) {
    return Meeting.fromJson(json);
  }
}

/// @nodoc
const $Meeting = _$MeetingTearOff();

/// @nodoc
mixin _$Meeting {
  Map<String, bool> get participantIds => throw _privateConstructorUsedError;
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError;
  Map<String, String> get participantUrls => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get time => throw _privateConstructorUsedError;
  String get createdUserId => throw _privateConstructorUsedError;
  int get participantCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeetingCopyWith<Meeting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingCopyWith<$Res> {
  factory $MeetingCopyWith(Meeting value, $Res Function(Meeting) then) =
      _$MeetingCopyWithImpl<$Res>;
  $Res call(
      {Map<String, bool> participantIds,
      Map<String, String> participantNames,
      Map<String, String> participantUrls,
      String id,
      String name,
      @TimestampConverter() DateTime time,
      String createdUserId,
      int participantCount});
}

/// @nodoc
class _$MeetingCopyWithImpl<$Res> implements $MeetingCopyWith<$Res> {
  _$MeetingCopyWithImpl(this._value, this._then);

  final Meeting _value;
  // ignore: unused_field
  final $Res Function(Meeting) _then;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? participantNames = freezed,
    Object? participantUrls = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? time = freezed,
    Object? createdUserId = freezed,
    Object? participantCount = freezed,
  }) {
    return _then(_value.copyWith(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      participantNames: participantNames == freezed
          ? _value.participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participantUrls: participantUrls == freezed
          ? _value.participantUrls
          : participantUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdUserId: createdUserId == freezed
          ? _value.createdUserId
          : createdUserId // ignore: cast_nullable_to_non_nullable
              as String,
      participantCount: participantCount == freezed
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MeetingCopyWith<$Res> implements $MeetingCopyWith<$Res> {
  factory _$MeetingCopyWith(_Meeting value, $Res Function(_Meeting) then) =
      __$MeetingCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, bool> participantIds,
      Map<String, String> participantNames,
      Map<String, String> participantUrls,
      String id,
      String name,
      @TimestampConverter() DateTime time,
      String createdUserId,
      int participantCount});
}

/// @nodoc
class __$MeetingCopyWithImpl<$Res> extends _$MeetingCopyWithImpl<$Res>
    implements _$MeetingCopyWith<$Res> {
  __$MeetingCopyWithImpl(_Meeting _value, $Res Function(_Meeting) _then)
      : super(_value, (v) => _then(v as _Meeting));

  @override
  _Meeting get _value => super._value as _Meeting;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? participantNames = freezed,
    Object? participantUrls = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? time = freezed,
    Object? createdUserId = freezed,
    Object? participantCount = freezed,
  }) {
    return _then(_Meeting(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      participantNames: participantNames == freezed
          ? _value.participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participantUrls: participantUrls == freezed
          ? _value.participantUrls
          : participantUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdUserId: createdUserId == freezed
          ? _value.createdUserId
          : createdUserId // ignore: cast_nullable_to_non_nullable
              as String,
      participantCount: participantCount == freezed
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meeting implements _Meeting {
  _$_Meeting(
      {required this.participantIds,
      required this.participantNames,
      required this.participantUrls,
      required this.id,
      required this.name,
      @TimestampConverter() required this.time,
      required this.createdUserId,
      required this.participantCount});

  factory _$_Meeting.fromJson(Map<String, dynamic> json) =>
      _$_$_MeetingFromJson(json);

  @override
  final Map<String, bool> participantIds;
  @override
  final Map<String, String> participantNames;
  @override
  final Map<String, String> participantUrls;
  @override
  final String id;
  @override
  final String name;
  @override
  @TimestampConverter()
  final DateTime time;
  @override
  final String createdUserId;
  @override
  final int participantCount;

  @override
  String toString() {
    return 'Meeting(participantIds: $participantIds, participantNames: $participantNames, participantUrls: $participantUrls, id: $id, name: $name, time: $time, createdUserId: $createdUserId, participantCount: $participantCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Meeting &&
            (identical(other.participantIds, participantIds) ||
                const DeepCollectionEquality()
                    .equals(other.participantIds, participantIds)) &&
            (identical(other.participantNames, participantNames) ||
                const DeepCollectionEquality()
                    .equals(other.participantNames, participantNames)) &&
            (identical(other.participantUrls, participantUrls) ||
                const DeepCollectionEquality()
                    .equals(other.participantUrls, participantUrls)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.createdUserId, createdUserId) ||
                const DeepCollectionEquality()
                    .equals(other.createdUserId, createdUserId)) &&
            (identical(other.participantCount, participantCount) ||
                const DeepCollectionEquality()
                    .equals(other.participantCount, participantCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(participantIds) ^
      const DeepCollectionEquality().hash(participantNames) ^
      const DeepCollectionEquality().hash(participantUrls) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(createdUserId) ^
      const DeepCollectionEquality().hash(participantCount);

  @JsonKey(ignore: true)
  @override
  _$MeetingCopyWith<_Meeting> get copyWith =>
      __$MeetingCopyWithImpl<_Meeting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MeetingToJson(this);
  }
}

abstract class _Meeting implements Meeting {
  factory _Meeting(
      {required Map<String, bool> participantIds,
      required Map<String, String> participantNames,
      required Map<String, String> participantUrls,
      required String id,
      required String name,
      @TimestampConverter() required DateTime time,
      required String createdUserId,
      required int participantCount}) = _$_Meeting;

  factory _Meeting.fromJson(Map<String, dynamic> json) = _$_Meeting.fromJson;

  @override
  Map<String, bool> get participantIds => throw _privateConstructorUsedError;
  @override
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError;
  @override
  Map<String, String> get participantUrls => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get time => throw _privateConstructorUsedError;
  @override
  String get createdUserId => throw _privateConstructorUsedError;
  @override
  int get participantCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MeetingCopyWith<_Meeting> get copyWith =>
      throw _privateConstructorUsedError;
}
