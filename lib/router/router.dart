import 'package:auto_route/auto_route.dart';

import '../authentication/authentication_page.dart';
import '../compose_post/compose_post_page.dart';
import '../conversation/message_page.dart';
import '../detail_post/detail_post_page.dart';
import '../edit_profile/edit_profile_page.dart';
import '../home_page.dart';
import '../locale/locale_page.dart';
import '../require_login_page.dart';
import '../schedule_meeting/schedule_meeting_page.dart';
import '../setting/settings_page.dart';
import '../splash_page.dart';
import '../theme/theme_page.dart';
import '../user/user_page.dart';
import '../video/video_page.dart';

export 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      initial: true,
      page: SplashPage,
    ),
    AutoRoute<dynamic>(
      page: HomePage,
    ),
    AutoRoute<dynamic>(
      page: VideoPage,
    ),
    AutoRoute<dynamic>(
      page: ComposePostPage,
    ),
    AutoRoute<dynamic>(
      page: ComposePostPage,
    ),
    AutoRoute<dynamic>(
      page: DetailPostPage,
    ),
    AutoRoute<dynamic>(
      page: AuthenticationPage,
    ),
    AutoRoute<dynamic>(
      page: UserPage,
    ),
    AutoRoute<dynamic>(
      page: EditProfilePage,
    ),
    AutoRoute<dynamic>(
      page: LocalePage,
    ),
    AutoRoute<dynamic>(
      page: ThemePage,
    ),
    AutoRoute<dynamic>(
      page: SettingsPage,
    ),
    AutoRoute<dynamic>(
      page: MessagePage,
    ),
    AutoRoute<dynamic>(
      page: RequireLoginPage,
    ),
    AutoRoute<dynamic>(
      page: ScheduleMeetingPage,
    ),
  ],
)
class $RootRouter {}
