import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../comment/comment.dart';
import '../comment/comment_repository.dart';
import 'user.dart';

final commentsOfUserProvider = StateNotifierProvider.autoDispose
    .family<CommentController, AsyncValue<List<Comment>>, User>((ref, user) {
  return CommentController(ref.read, user);
});

class CommentController extends StateNotifier<AsyncValue<List<Comment>>> {
  final User _user;

  CommentController(this._read, this._user)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(commentRepositoryProvider)
          .observeCommentsOfUser(_user.id)
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

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
