// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
class _$ConversationTearOff {
  const _$ConversationTearOff();

  _Conversation call(
      {required Map<String, bool> participantIds,
      required Map<String, int> lastViews,
      required String id,
      required int participantCount}) {
    return _Conversation(
      participantIds: participantIds,
      lastViews: lastViews,
      id: id,
      participantCount: participantCount,
    );
  }

  Conversation fromJson(Map<String, Object> json) {
    return Conversation.fromJson(json);
  }
}

/// @nodoc
const $Conversation = _$ConversationTearOff();

/// @nodoc
mixin _$Conversation {
  Map<String, bool> get participantIds => throw _privateConstructorUsedError;
  Map<String, int> get lastViews => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get participantCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call(
      {Map<String, bool> participantIds,
      Map<String, int> lastViews,
      String id,
      int participantCount});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? lastViews = freezed,
    Object? id = freezed,
    Object? participantCount = freezed,
  }) {
    return _then(_value.copyWith(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      lastViews: lastViews == freezed
          ? _value.lastViews
          : lastViews // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      participantCount: participantCount == freezed
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, bool> participantIds,
      Map<String, int> lastViews,
      String id,
      int participantCount});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res> extends _$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(
      _Conversation _value, $Res Function(_Conversation) _then)
      : super(_value, (v) => _then(v as _Conversation));

  @override
  _Conversation get _value => super._value as _Conversation;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? lastViews = freezed,
    Object? id = freezed,
    Object? participantCount = freezed,
  }) {
    return _then(_Conversation(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      lastViews: lastViews == freezed
          ? _value.lastViews
          : lastViews // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_Conversation implements _Conversation {
  _$_Conversation(
      {required this.participantIds,
      required this.lastViews,
      required this.id,
      required this.participantCount});

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$_$_ConversationFromJson(json);

  @override
  final Map<String, bool> participantIds;
  @override
  final Map<String, int> lastViews;
  @override
  final String id;
  @override
  final int participantCount;

  @override
  String toString() {
    return 'Conversation(participantIds: $participantIds, lastViews: $lastViews, id: $id, participantCount: $participantCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Conversation &&
            (identical(other.participantIds, participantIds) ||
                const DeepCollectionEquality()
                    .equals(other.participantIds, participantIds)) &&
            (identical(other.lastViews, lastViews) ||
                const DeepCollectionEquality()
                    .equals(other.lastViews, lastViews)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.participantCount, participantCount) ||
                const DeepCollectionEquality()
                    .equals(other.participantCount, participantCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(participantIds) ^
      const DeepCollectionEquality().hash(lastViews) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(participantCount);

  @JsonKey(ignore: true)
  @override
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConversationToJson(this);
  }
}

abstract class _Conversation implements Conversation {
  factory _Conversation(
      {required Map<String, bool> participantIds,
      required Map<String, int> lastViews,
      required String id,
      required int participantCount}) = _$_Conversation;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  Map<String, bool> get participantIds => throw _privateConstructorUsedError;
  @override
  Map<String, int> get lastViews => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  int get participantCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConversationCopyWith<_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}
