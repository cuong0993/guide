import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'post_controller.dart';
import 'post_widget.dart';

class PostsWidget extends ConsumerWidget {
  const PostsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    return Scrollbar(
      child: NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels > 0 &&
                notification.metrics.atEdge) {}
            return true;
          },
          child: posts.when(
              data: (posts) => ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return PostWidget(post: post);
                    },
                  ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) =>
                  const Center(child: CircularProgressIndicator()))),
    );
  }
}
