// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required String userName,
      required String userId,
      required String userPhotoUrl,
      required String text,
      required String name,
      int commentCount = 0,
      List<String> likedUserIds = const <String>[],
      required List<String> tags,
      @ServerDateTimeConverter() required DateTime createdDate,
      @TimestampConverter() required List<DateTime> timeSlots,
      required List<String> images,
      String id = ''}) {
    return _Post(
      userName: userName,
      userId: userId,
      userPhotoUrl: userPhotoUrl,
      text: text,
      name: name,
      commentCount: commentCount,
      likedUserIds: likedUserIds,
      tags: tags,
      createdDate: createdDate,
      timeSlots: timeSlots,
      images: images,
      id: id,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userPhotoUrl => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  List<String> get likedUserIds => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @ServerDateTimeConverter()
  DateTime get createdDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  List<DateTime> get timeSlots => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String userId,
      String userPhotoUrl,
      String text,
      String name,
      int commentCount,
      List<String> likedUserIds,
      List<String> tags,
      @ServerDateTimeConverter() DateTime createdDate,
      @TimestampConverter() List<DateTime> timeSlots,
      List<String> images,
      String id});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userId = freezed,
    Object? userPhotoUrl = freezed,
    Object? text = freezed,
    Object? name = freezed,
    Object? commentCount = freezed,
    Object? likedUserIds = freezed,
    Object? tags = freezed,
    Object? createdDate = freezed,
    Object? timeSlots = freezed,
    Object? images = freezed,
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
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedUserIds: likedUserIds == freezed
          ? _value.likedUserIds
          : likedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSlots: timeSlots == freezed
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String userId,
      String userPhotoUrl,
      String text,
      String name,
      int commentCount,
      List<String> likedUserIds,
      List<String> tags,
      @ServerDateTimeConverter() DateTime createdDate,
      @TimestampConverter() List<DateTime> timeSlots,
      List<String> images,
      String id});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userId = freezed,
    Object? userPhotoUrl = freezed,
    Object? text = freezed,
    Object? name = freezed,
    Object? commentCount = freezed,
    Object? likedUserIds = freezed,
    Object? tags = freezed,
    Object? createdDate = freezed,
    Object? timeSlots = freezed,
    Object? images = freezed,
    Object? id = freezed,
  }) {
    return _then(_Post(
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
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedUserIds: likedUserIds == freezed
          ? _value.likedUserIds
          : likedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSlots: timeSlots == freezed
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  _$_Post(
      {required this.userName,
      required this.userId,
      required this.userPhotoUrl,
      required this.text,
      required this.name,
      this.commentCount = 0,
      this.likedUserIds = const <String>[],
      required this.tags,
      @ServerDateTimeConverter() required this.createdDate,
      @TimestampConverter() required this.timeSlots,
      required this.images,
      this.id = ''});

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final String userName;
  @override
  final String userId;
  @override
  final String userPhotoUrl;
  @override
  final String text;
  @override
  final String name;
  @JsonKey(defaultValue: 0)
  @override
  final int commentCount;
  @JsonKey(defaultValue: const <String>[])
  @override
  final List<String> likedUserIds;
  @override
  final List<String> tags;
  @override
  @ServerDateTimeConverter()
  final DateTime createdDate;
  @override
  @TimestampConverter()
  final List<DateTime> timeSlots;
  @override
  final List<String> images;
  @JsonKey(defaultValue: '')
  @override
  final String id;

  @override
  String toString() {
    return 'Post(userName: $userName, userId: $userId, userPhotoUrl: $userPhotoUrl, text: $text, name: $name, commentCount: $commentCount, likedUserIds: $likedUserIds, tags: $tags, createdDate: $createdDate, timeSlots: $timeSlots, images: $images, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.userPhotoUrl, userPhotoUrl)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)) &&
            (identical(other.likedUserIds, likedUserIds) ||
                const DeepCollectionEquality()
                    .equals(other.likedUserIds, likedUserIds)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.timeSlots, timeSlots) ||
                const DeepCollectionEquality()
                    .equals(other.timeSlots, timeSlots)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userPhotoUrl) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(commentCount) ^
      const DeepCollectionEquality().hash(likedUserIds) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(timeSlots) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required String userName,
      required String userId,
      required String userPhotoUrl,
      required String text,
      required String name,
      int commentCount,
      List<String> likedUserIds,
      required List<String> tags,
      @ServerDateTimeConverter() required DateTime createdDate,
      @TimestampConverter() required List<DateTime> timeSlots,
      required List<String> images,
      String id}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get userName => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get userPhotoUrl => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get commentCount => throw _privateConstructorUsedError;
  @override
  List<String> get likedUserIds => throw _privateConstructorUsedError;
  @override
  List<String> get tags => throw _privateConstructorUsedError;
  @override
  @ServerDateTimeConverter()
  DateTime get createdDate => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  List<DateTime> get timeSlots => throw _privateConstructorUsedError;
  @override
  List<String> get images => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
