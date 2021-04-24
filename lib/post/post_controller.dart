import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'post.dart';
import 'post_repository.dart';

final postsProvider =
    StateNotifierProvider<PostController, AsyncValue<List<Post>>>((ref) {
  return PostController(ref.read);
});

class PostController extends StateNotifier<AsyncValue<List<Post>>> {
  PostController(this._read) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription =
          _read(postRepositoryProvider).observePosts().listen((posts) {
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
