// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../authentication/authentication_page.dart' as _i8;
import '../compose_post/compose_post_page.dart' as _i6;
import '../conversation/message_page.dart' as _i14;
import '../detail_post/detail_post_page.dart' as _i7;
import '../edit_profile/edit_profile_page.dart' as _i10;
import '../home_page.dart' as _i4;
import '../locale/locale_page.dart' as _i11;
import '../post/post.dart' as _i17;
import '../require_login_page.dart' as _i15;
import '../schedule_meeting/schedule_meeting_page.dart' as _i16;
import '../setting/settings_page.dart' as _i13;
import '../splash_page.dart' as _i3;
import '../theme/theme_page.dart' as _i12;
import '../user/user.dart' as _i18;
import '../user/user_page.dart' as _i9;
import '../video/video_page.dart' as _i5;

class RootRouter extends _i1.RootStackRouter {
  RootRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.HomePage();
        }),
    VideoRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<VideoRouteArgs>();
          return _i5.VideoPage(key: args.key, arguments: args.arguments);
        }),
    ComposePostRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.ComposePostPage();
        }),
    DetailPostRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DetailPostRouteArgs>();
          return _i7.DetailPostPage(
              key: args.key,
              post: args.post,
              isGoingToComment: args.isGoingToComment);
        }),
    AuthenticationRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.AuthenticationPage();
        }),
    UserRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<UserRouteArgs>();
          return _i9.UserPage(key: args.key, userId: args.userId);
        }),
    EditProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditProfileRouteArgs>();
          return _i10.EditProfilePage(key: args.key, user: args.user);
        }),
    LocaleRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i11.LocalePage();
        }),
    ThemeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i12.ThemePage();
        }),
    SettingsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i13.SettingsPage();
        }),
    MessageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MessageRouteArgs>();
          return _i14.MessagePage(
              key: args.key,
              conversationId: args.conversationId,
              isGoingToMessage: args.isGoingToMessage);
        }),
    RequireLoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i15.RequireLoginPage();
        }),
    ScheduleMeetingRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ScheduleMeetingRouteArgs>();
          return _i16.ScheduleMeetingPage(key: args.key, post: args.post);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(VideoRoute.name, path: '/video-page'),
        _i1.RouteConfig(ComposePostRoute.name, path: '/compose-post-page'),
        _i1.RouteConfig(ComposePostRoute.name, path: '/compose-post-page'),
        _i1.RouteConfig(DetailPostRoute.name, path: '/detail-post-page'),
        _i1.RouteConfig(AuthenticationRoute.name, path: '/authentication-page'),
        _i1.RouteConfig(UserRoute.name, path: '/user-page'),
        _i1.RouteConfig(EditProfileRoute.name, path: '/edit-profile-page'),
        _i1.RouteConfig(LocaleRoute.name, path: '/locale-page'),
        _i1.RouteConfig(ThemeRoute.name, path: '/theme-page'),
        _i1.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i1.RouteConfig(MessageRoute.name, path: '/message-page'),
        _i1.RouteConfig(RequireLoginRoute.name, path: '/require-login-page'),
        _i1.RouteConfig(ScheduleMeetingRoute.name,
            path: '/schedule-meeting-page')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class VideoRoute extends _i1.PageRouteInfo<VideoRouteArgs> {
  VideoRoute({_i2.Key? key, required Map<dynamic, dynamic> arguments})
      : super(name,
            path: '/video-page',
            args: VideoRouteArgs(key: key, arguments: arguments));

  static const String name = 'VideoRoute';
}

class VideoRouteArgs {
  const VideoRouteArgs({this.key, required this.arguments});

  final _i2.Key? key;

  final Map<dynamic, dynamic> arguments;
}

class ComposePostRoute extends _i1.PageRouteInfo {
  const ComposePostRoute() : super(name, path: '/compose-post-page');

  static const String name = 'ComposePostRoute';
}

class DetailPostRoute extends _i1.PageRouteInfo<DetailPostRouteArgs> {
  DetailPostRoute(
      {_i2.Key? key, required _i17.Post post, required bool isGoingToComment})
      : super(name,
            path: '/detail-post-page',
            args: DetailPostRouteArgs(
                key: key, post: post, isGoingToComment: isGoingToComment));

  static const String name = 'DetailPostRoute';
}

class DetailPostRouteArgs {
  const DetailPostRouteArgs(
      {this.key, required this.post, required this.isGoingToComment});

  final _i2.Key? key;

  final _i17.Post post;

  final bool isGoingToComment;
}

class AuthenticationRoute extends _i1.PageRouteInfo {
  const AuthenticationRoute() : super(name, path: '/authentication-page');

  static const String name = 'AuthenticationRoute';
}

class UserRoute extends _i1.PageRouteInfo<UserRouteArgs> {
  UserRoute({_i2.Key? key, required String userId})
      : super(name,
            path: '/user-page', args: UserRouteArgs(key: key, userId: userId));

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({this.key, required this.userId});

  final _i2.Key? key;

  final String userId;
}

class EditProfileRoute extends _i1.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i2.Key? key, required _i18.User user})
      : super(name,
            path: '/edit-profile-page',
            args: EditProfileRouteArgs(key: key, user: user));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.user});

  final _i2.Key? key;

  final _i18.User user;
}

class LocaleRoute extends _i1.PageRouteInfo {
  const LocaleRoute() : super(name, path: '/locale-page');

  static const String name = 'LocaleRoute';
}

class ThemeRoute extends _i1.PageRouteInfo {
  const ThemeRoute() : super(name, path: '/theme-page');

  static const String name = 'ThemeRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

class MessageRoute extends _i1.PageRouteInfo<MessageRouteArgs> {
  MessageRoute(
      {_i2.Key? key,
      required String conversationId,
      required bool isGoingToMessage})
      : super(name,
            path: '/message-page',
            args: MessageRouteArgs(
                key: key,
                conversationId: conversationId,
                isGoingToMessage: isGoingToMessage));

  static const String name = 'MessageRoute';
}

class MessageRouteArgs {
  const MessageRouteArgs(
      {this.key, required this.conversationId, required this.isGoingToMessage});

  final _i2.Key? key;

  final String conversationId;

  final bool isGoingToMessage;
}

class RequireLoginRoute extends _i1.PageRouteInfo {
  const RequireLoginRoute() : super(name, path: '/require-login-page');

  static const String name = 'RequireLoginRoute';
}

class ScheduleMeetingRoute extends _i1.PageRouteInfo<ScheduleMeetingRouteArgs> {
  ScheduleMeetingRoute({_i2.Key? key, required _i17.Post post})
      : super(name,
            path: '/schedule-meeting-page',
            args: ScheduleMeetingRouteArgs(key: key, post: post));

  static const String name = 'ScheduleMeetingRoute';
}

class ScheduleMeetingRouteArgs {
  const ScheduleMeetingRouteArgs({this.key, required this.post});

  final _i2.Key? key;

  final _i17.Post post;
}
