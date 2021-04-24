// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
class _$LikeTearOff {
  const _$LikeTearOff();

  _Like call(
      {required String userName,
      required String userId,
      required String userPhotoUrl,
      @ServerDateTimeConverter() required DateTime createdDate,
      required String id}) {
    return _Like(
      userName: userName,
      userId: userId,
      userPhotoUrl: userPhotoUrl,
      createdDate: createdDate,
      id: id,
    );
  }

  Like fromJson(Map<String, Object> json) {
    return Like.fromJson(json);
  }
}

/// @nodoc
const $Like = _$LikeTearOff();

/// @nodoc
mixin _$Like {
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userPhotoUrl => throw _privateConstructorUsedError;
  @ServerDateTimeConverter()
  DateTime get createdDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String userId,
      String userPhotoUrl,
      @ServerDateTimeConverter() DateTime createdDate,
      String id});
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  final Like _value;
  // ignore: unused_field
  final $Res Function(Like) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userId = freezed,
    Object? userPhotoUrl = freezed,
    Object? createdDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) then) =
      __$LikeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String userId,
      String userPhotoUrl,
      @ServerDateTimeConverter() DateTime createdDate,
      String id});
}

/// @nodoc
class __$LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res>
    implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(_Like _value, $Res Function(_Like) _then)
      : super(_value, (v) => _then(v as _Like));

  @override
  _Like get _value => super._value as _Like;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userId = freezed,
    Object? userPhotoUrl = freezed,
    Object? createdDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_Like(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Like implements _Like {
  _$_Like(
      {required this.userName,
      required this.userId,
      required this.userPhotoUrl,
      @ServerDateTimeConverter() required this.createdDate,
      required this.id});

  factory _$_Like.fromJson(Map<String, dynamic> json) =>
      _$_$_LikeFromJson(json);

  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userPhotoUrl;
  @override
  @ServerDateTimeConverter()
  final DateTime createdDate;
  @override
  final String id;

  @override
  String toString() {
    return 'Like(userName: $userName, userId: $userId, userPhotoUrl: $userPhotoUrl, createdDate: $createdDate, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Like &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.userPhotoUrl, userPhotoUrl)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userPhotoUrl) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$LikeCopyWith<_Like> get copyWith =>
      __$LikeCopyWithImpl<_Like>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LikeToJson(this);
  }
}

abstract class _Like implements Like {
  factory _Like(
      {required String userName,
      required String userId,
      required String userPhotoUrl,
      @ServerDateTimeConverter() required DateTime createdDate,
      required String id}) = _$_Like;

  factory _Like.fromJson(Map<String, dynamic> json) = _$_Like.fromJson;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get userPhotoUrl => throw _privateConstructorUsedError;
  @override
  @ServerDateTimeConverter()
  DateTime get createdDate => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LikeCopyWith<_Like> get copyWith => throw _privateConstructorUsedError;
}
