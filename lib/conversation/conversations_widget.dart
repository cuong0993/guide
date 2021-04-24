import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../authentication/authentication_controller.dart';
import '../require_login_page.dart';
import 'conversation_controller.dart';
import 'conversation_widget.dart';

class ConversationsWidget extends ConsumerWidget {
  const ConversationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authenticationProvider).when(
        loading: () => const Center(child: CircularProgressIndicator()),
        authenticated: () {
          final conversations = ref.watch(conversationProvider);
          return Scrollbar(
            child: NotificationListener<ScrollEndNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels > 0 &&
                      notification.metrics.atEdge) {}
                  return true;
                },
                child: conversations.when(
                    data: (conversations) => ListView.builder(
                          itemCount: conversations.length,
                          itemBuilder: (context, index) {
                            final conversation = conversations[index];
                            return ConversationWidget(
                                conversation: conversation);
                          },
                        ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (_, __) =>
                        const Center(child: CircularProgressIndicator()))),
          );
        },
        unauthenticated: () => const Center(child: RequireLoginWidget()));
  }
}
