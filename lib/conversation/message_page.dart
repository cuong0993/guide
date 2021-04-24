import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'conversation_controller.dart';
import 'message_controller.dart';

class MessagePage extends HookConsumerWidget {
  final bool isGoingToMessage;
  final String conversationId;

  const MessagePage(
      {Key? key, required this.conversationId, required this.isGoingToMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final textEditingController = useTextEditingController();
    final messageState = useState('');
    final messages = ref.watch(messageProvider(conversationId));
    useEffect(() {
      ref.read(conversationProvider.notifier).markAsRead(conversationId);
      if (isGoingToMessage) {
        SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
          focusNode.requestFocus();
        });
      }
    }, [conversationId]);
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        isAlwaysShown: true,
        child: messages.when(
            data: (comments) => ListView.builder(
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: CachedNetworkImageProvider(
                              comments[index].userPhotoUrl),
                        ),
                        title: Text(
                          comments[index].userName,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          timeago.format(comments[index].createdDate),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          comments[index].text,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Divider()
                    ],
                  );
                }),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Center(child: CircularProgressIndicator())),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  maxLines: null,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message',
                      hintStyle: TextStyle(fontSize: 18)),
                  onChanged: (text) {
                    messageState.value = text;
                  },
                ),
              ),
              Consumer(builder: (context, ref, child) {
                final enabled = messageState.value.isNotEmpty;
                if (enabled) {
                  return IconButton(
                    color: Theme.of(context).buttonColor,
                    icon: const Icon(
                      Icons.send_rounded,
                    ),
                    onPressed: () async {
                      await ref
                          .read(messageProvider(conversationId).notifier)
                          .message(messageState.value);
                      focusNode.unfocus();
                      textEditingController.clear();
                    },
                  );
                } else {
                  return IconButton(
                    color: Theme.of(context).disabledColor,
                    icon: const Icon(
                      Icons.send_rounded,
                    ),
                    onPressed: () {},
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
