import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../post/post.dart';
import '../post/post_repository.dart';
import 'user.dart';

final postsOfUserProvider = StateNotifierProvider.autoDispose
    .family<PostController, AsyncValue<List<Post>>, User>((ref, user) {
  return PostController(ref.read, user);
});

class PostController extends StateNotifier<AsyncValue<List<Post>>> {
  final User _user;

  PostController(this._read, this._user) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(postRepositoryProvider)
          .observePostsOfUser(_user.id)
          .listen((posts) {
        posts.sort((a, b) {
          return a.createdDate.compareTo(b.createdDate);
        });
        state = AsyncValue.data(posts);
      });
    }
  }

  StreamSubscription? _subscription;
  final Reader _read;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
