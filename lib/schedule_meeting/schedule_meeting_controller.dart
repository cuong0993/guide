import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../meetings/meeting_repository.dart';
import '../post/post.dart';
import '../user/user_controller.dart';
import '../user/user_repository.dart';

final scheduleMeetingControllerProvider = ChangeNotifierProvider.autoDispose
    .family<ScheduleMeetingController, Post>((ref, post) {
  return ScheduleMeetingController(ref.read, post);
});

class ScheduleMeetingController extends ChangeNotifier {
  final Post post;
  final Reader _read;

  ScheduleMeetingController(this._read, this.post);

  Future<void> scheduleMeeting(DateTime time) async {
    final user2 = await _read(userRepositoryProvider).getUser(post.userId);
    await _read(userProvider).when(data: (user) async {
      await _read(meetingRepositoryProvider)
          .createMeetingWithUser(user, user2, time, post.name);
    }, loading: () {
      return;
    }, error: (_, __) {
      return;
    });
  }
}
