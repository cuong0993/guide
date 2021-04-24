import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../post/post.dart';
import '../post/post_controller.dart';
import '../user/user_controller.dart';
import 'like.dart';
import 'like_repository.dart';

final likedProvider = Provider.autoDispose.family<bool, Post>((ref, post) {
  return ref.watch(userProvider).when(data: (user) {
    return ref.watch(postsProvider).when(data: (posts) {
      final updatedPost = posts.firstWhere((element) => element.id == post.id);
      return updatedPost.likedUserIds.contains(user.id);
    }, loading: () {
      return post.likedUserIds.contains(user.id);
    }, error: (_, __) {
      return post.likedUserIds.contains(user.id);
    });
  }, loading: () {
    return false;
  }, error: (_, __) {
    return false;
  });
});

final likeProvider = StateNotifierProvider.autoDispose
    .family<LikeController, AsyncValue<List<Like>>, Post>((ref, post) {
  return LikeController(ref.read, post);
});

final likeCountProvider = Provider.autoDispose.family<int, Post>((ref, post) {
  return ref.watch(postsProvider).when(data: (posts) {
    final updatedPost = posts.firstWhere((element) => element.id == post.id);
    return updatedPost.likedUserIds.length;
  }, loading: () {
    return post.likedUserIds.length;
  }, error: (_, __) {
    return post.likedUserIds.length;
  });
});

class LikeController extends StateNotifier<AsyncValue<List<Like>>> {
  final Post _post;

  LikeController(this._read, this._post) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(likeRepositoryProvider)
          .observeLikes(_post.id)
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

  Future<void> toggleLike(bool doLike) async {
    await _read(userProvider).when(data: (user) async {
      final likeRepository = _read(likeRepositoryProvider);
      if (doLike) {
        await likeRepository.like(_post.id, user);
      } else {
        await likeRepository.unLike(_post.id, user);
      }
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
