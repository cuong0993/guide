import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/router.dart';
import 'conversation.dart';

class ConversationWidget extends StatelessWidget {
  final Conversation conversation;

  const ConversationWidget({Key? key, required this.conversation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: GestureDetector(
          onTap: () => AutoRouter.of(context).push(MessageRoute(
              isGoingToMessage: false, conversationId: conversation.id)),
          child: Container(
            color: Theme.of(context).cardColor,
            child: Text(conversation.participantIds.toString()),
          ),
        ));
  }
}
