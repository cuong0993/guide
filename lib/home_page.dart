import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'authentication/authentication_controller.dart';
import 'authentication/authentication_state.dart';
import 'conversation/conversations_widget.dart';
import 'meetings/meetings_widget.dart';
import 'post/posts_widget.dart';
import 'router/router.dart';
import 'user/user_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = useMemoized(() => <BottomNavigationBarItem, Widget>{
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'posts'): const PostsWidget(),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'search'): const MeetingsWidget(),
          const BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'):
              const SizedBox.shrink(),
          const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'meetings'): const MeetingsWidget(),
          const BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
              label: 'messages'): const ConversationsWidget(),
        });
    final tabState = useState(0);
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context)!.app_name,
              style: Theme.of(context).appBarTheme.textTheme!.headline5),
          actions: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                final user = ref.watch(userProvider);
                return user.when(
                    data: (user) => IconButton(
                        icon: ClipOval(
                          child: Image.network(
                            user.photoUrl,
                            errorBuilder: (context, exception, stackTrace) {
                              return const Icon(Icons.account_circle_rounded);
                            },
                          ),
                        ),
                        onPressed: () => AutoRouter.of(context)
                            .push(UserRoute(userId: user.id))),
                    loading: () => const Icon(Icons.account_circle_rounded),
                    error: (_, __) => IconButton(
                          icon: const Icon(Icons.account_circle_rounded),
                          onPressed: () => AutoRouter.of(context)
                              .push(const AuthenticationRoute()),
                        ));
              },
            ),
          ],
        ),
        body: tabs.values.toList()[tabState.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: tabState.value,
          items: tabs.keys.toList(),
          onTap: (index) {
            if (tabs.keys.toList()[index].label == 'add') {
              final authentication = ref.read(authenticationProvider);
              if (authentication is AuthenticationStateAuthenticated) {
                AutoRouter.of(context).push(const ComposePostRoute());
              } else {
                AutoRouter.of(context).push(const RequireLoginRoute());
              }
            } else {
              tabState.value = index;
            }
          },
        ));
  }
}
