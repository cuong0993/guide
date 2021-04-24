import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../post/post.dart';
import '../post/view_image.dart';
import '../router/router.dart';
import '../widgets/custom_image.dart';
import 'comment_controller.dart';
import 'like_controller.dart';

class DetailPostPage extends HookConsumerWidget {
  final Post post;
  final bool isGoingToComment;

  const DetailPostPage(
      {Key? key, required this.post, required this.isGoingToComment})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final textEditingController = useTextEditingController();
    final commentState = useState('');
    final comments = ref.watch(commentProvider(post));
    useEffect(() {
      if (isGoingToComment) {
        SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
          focusNode.requestFocus();
        });
      }
    }, [post]);
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () =>
              AutoRouter.of(context).push(UserRoute(userId: post.userId)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              post.userPhotoUrl.isNotEmpty
                  ? CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xff4D4D4D),
                      backgroundImage:
                          CachedNetworkImageProvider(post.userPhotoUrl),
                    )
                  : const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff4D4D4D),
                    ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    post.userName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(timeago.format(post.createdDate),
                      style: const TextStyle(fontSize: 10))
                ],
              ),
            ],
          ),
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: post.text.toString().isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    post.text,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: post.images.length,
                  itemBuilder: (context, index) {
                    return OpenContainer(
                        openBuilder: (context, _) {
                          return ViewImage(post: post, index: index);
                        },
                        closedShape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                        closedBuilder: (context, openContainer) {
                          return CustomImage(imageUrl: post.images[index]);
                        });
                  }),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: post.tags
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Consumer(builder: (context, ref, child) {
                          final liked = ref.watch(likedProvider(post));
                          return IconButton(
                            icon: Icon(
                              Icons.arrow_upward,
                              color:
                                  liked ? Theme.of(context).accentColor : null,
                            ),
                            onPressed: () async {
                              await ref
                                  .read(likeProvider(post).notifier)
                                  .toggleLike(!liked);
                            },
                          );
                        }),
                        const SizedBox(width: 16),
                        Consumer(builder: (context, ref, child) {
                          final likeCount = ref.watch(likeCountProvider(post));
                          return Visibility(
                            visible: likeCount > 0,
                            child: Text(
                              likeCount.toString(),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          );
                        }),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () => focusNode.requestFocus(),
                        ),
                        const SizedBox(width: 16),
                        Consumer(builder: (context, ref, child) {
                          final commentCount =
                              ref.watch(commentCountProvider(post));
                          return Visibility(
                            visible: commentCount > 0,
                            child: Text(
                              commentCount.toString(),
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          );
                        }),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.video_call_rounded),
                      onPressed: () => AutoRouter.of(context)
                          .push(ScheduleMeetingRoute(post: post)),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 4),
              comments.when(
                  data: (comments) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                timeago.format(comments[index].createdDate),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                comments[index].text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const Divider()
                          ],
                        );
                      }),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (_, __) =>
                      const Center(child: CircularProgressIndicator()))
            ],
          ),
        ),
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
                      hintText: 'Add a comment',
                      hintStyle: TextStyle(fontSize: 18)),
                  onChanged: (text) {
                    commentState.value = text;
                  },
                ),
              ),
              Consumer(builder: (context, ref, child) {
                final enabled = commentState.value.isNotEmpty;
                if (enabled) {
                  return IconButton(
                    color: Theme.of(context).buttonColor,
                    icon: const Icon(
                      Icons.send_rounded,
                    ),
                    onPressed: () async {
                      await ref
                          .read(commentProvider(post).notifier)
                          .comment(commentState.value);
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
