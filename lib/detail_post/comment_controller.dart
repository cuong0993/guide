import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../comment/comment.dart';
import '../comment/comment_repository.dart';
import '../post/post.dart';
import '../post/post_controller.dart';
import '../user/user_controller.dart';

final commentProvider = StateNotifierProvider.autoDispose
    .family<CommentController, AsyncValue<List<Comment>>, Post>((ref, post) {
  return CommentController(ref.read, post);
});

final commentCountProvider =
    Provider.autoDispose.family<int, Post>((ref, post) {
  return ref.watch(postsProvider).when(data: (posts) {
    final updatedPost = posts.firstWhere((element) => element.id == post.id);
    return updatedPost.commentCount;
  }, loading: () {
    return post.commentCount;
  }, error: (_, __) {
    return post.commentCount;
  });
});

class CommentController extends StateNotifier<AsyncValue<List<Comment>>> {
  final Post _post;

  CommentController(this._read, this._post)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(commentRepositoryProvider)
          .observeCommentsOfPost(_post.id)
          .listen((comments) {
        comments.sort((a, b) {
          return a.createdDate.compareTo(b.createdDate);
        });
        state = AsyncValue.data(comments);
      });
    }
  }

  StreamSubscription? _subscription;
  final Reader _read;

  Future<void> comment(String text) async {
    await _read(userProvider).when(data: (user) async {
      await _read(commentRepositoryProvider).comment(user, _post.id, text);
    }, loading: () {
      return;
    }, error: (_, __) {
      return;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
