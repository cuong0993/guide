import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../conversation/conversation_repository.dart';
import '../router/router.dart';
import 'comment_controller.dart';
import 'post_controller.dart';
import 'profile_controller.dart';
import 'user.dart';
import 'user_controller.dart';

class UserPage extends StatelessWidget {
  final String userId;

  const UserPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = <String, Widget Function(User user)>{
      L10n.of(context)!.posts: (user) {
        return Consumer(builder: (context, ref, child) {
          final posts = ref.watch(postsOfUserProvider(user));
          return posts.when(
              data: (posts) => ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final comment = posts[index];
                      return Text(comment.text);
                    },
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: CircularProgressIndicator()));
        });
      },
      L10n.of(context)!.comments: (user) {
        return Consumer(builder: (context, ref, child) {
          final comments = ref.watch(commentsOfUserProvider(user));
          return comments.when(
              data: (comments) => ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return Text(comment.text);
                    },
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: CircularProgressIndicator()));
        });
      },
    };
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(L10n.of(context)!.account),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    L10n.of(context)!.log_out,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
        body: HookConsumer(builder: (context, ref, child) {
          final tabController = useTabController(initialLength: tabs.length);
          final user = ref.watch(profileProvider(userId));
          return user.when(
              data: (user) {
                final isMe =
                    user.id == firebase.FirebaseAuth.instance.currentUser!.uid;
                return NestedScrollView(
                  floatHeaderSlivers: false,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                          backgroundColor: Theme.of(context).cardColor,
                          leading: const SizedBox.shrink(),
                          expandedHeight: 400,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(user.photoUrl),
                                        radius: 40,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 32),
                                        Row(
                                          children: [
                                            const Visibility(
                                              visible: false,
                                              child: SizedBox(width: 10),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 130,
                                                  child: Text(
                                                    user.name,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w900),
                                                    maxLines: null,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 130,
                                                  child: Text(
                                                    'TODO Country',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      'TODO Email',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final conversation = await ref
                                                    .read(
                                                        conversationRepositoryProvider)
                                                    .getConversationWithUser(
                                                        firebase
                                                            .FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid,
                                                        userId);
                                                if (conversation == null) {
                                                  final newConversation = await ref
                                                      .read(
                                                          conversationRepositoryProvider)
                                                      .createConversationWithUser(
                                                          firebase
                                                              .FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid,
                                                          userId);

                                                  await AutoRouter.of(context)
                                                      .push(MessageRoute(
                                                          isGoingToMessage:
                                                              true,
                                                          conversationId:
                                                              newConversation
                                                                  .id));
                                                } else {
                                                  await AutoRouter.of(context)
                                                      .push(MessageRoute(
                                                          isGoingToMessage:
                                                              true,
                                                          conversationId:
                                                              conversation.id));
                                                }
                                              },
                                              child: Icon(Icons.notifications,
                                                  color: Theme.of(context)
                                                      .accentColor),
                                            ),
                                            () {
                                              if (isMe) {
                                                return InkWell(
                                                  onTap: () {
                                                    AutoRouter.of(context).push(
                                                        const SettingsRoute());
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Icon(Icons.settings,
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor),
                                                      Text(
                                                        L10n.of(context)!
                                                            .settings,
                                                        style: const TextStyle(
                                                            fontSize: 11.5),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              } else {
                                                return InkWell(
                                                  onTap: () async {
                                                    final conversation = await ref
                                                        .read(
                                                            conversationRepositoryProvider)
                                                        .getConversationWithUser(
                                                            firebase
                                                                .FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid,
                                                            userId);
                                                    if (conversation == null) {
                                                      final newConversation = await ref
                                                          .read(
                                                              conversationRepositoryProvider)
                                                          .createConversationWithUser(
                                                              firebase
                                                                  .FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .uid,
                                                              userId);

                                                      await AutoRouter.of(
                                                              context)
                                                          .push(MessageRoute(
                                                              isGoingToMessage:
                                                                  true,
                                                              conversationId:
                                                                  newConversation
                                                                      .id));
                                                    } else {
                                                      await AutoRouter.of(
                                                              context)
                                                          .push(MessageRoute(
                                                              isGoingToMessage:
                                                                  true,
                                                              conversationId:
                                                                  conversation
                                                                      .id));
                                                    }
                                                  },
                                                  child: Icon(Icons.chat_bubble,
                                                      color: Theme.of(context)
                                                          .accentColor),
                                                );
                                              }
                                            }(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10, left: 20),
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      'TODO Bio',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: null,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                buildButton(L10n.of(context)!.edit_profile, () {
                                  final user = ref.read(userProvider);
                                  return user.when(
                                      data: (user) {
                                        AutoRouter.of(context)
                                            .push(EditProfileRoute(user: user));
                                      },
                                      loading: () {},
                                      error: (_, __) {});
                                }),
                              ],
                            ),
                          ),
                          floating: true,
                          pinned: true,
                          snap: false,
                          forceElevated: false,
                          bottom: TabBar(
                              isScrollable: true,
                              controller: tabController,
                              tabs: tabs.keys
                                  .map((e) => Tab(
                                        text: e,
                                      ))
                                  .toList())),
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    children: tabs.values.map((e) => e.call(user)).toList(),
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: CircularProgressIndicator()));
        }));
  }
}

Center buildButton(String text, Function() function) {
  return Center(
    child: GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff597FDB),
              Color(0xff597FDB),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
