import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meeting.dart';
import 'meeting_repository.dart';

final meetingProvider = StateNotifierProvider.autoDispose<MeetingController,
    AsyncValue<List<Meeting>>>((ref) {
  return MeetingController(ref.read);
});

class MeetingController extends StateNotifier<AsyncValue<List<Meeting>>> {
  MeetingController(this._read) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(meetingRepositoryProvider)
          .observeMeetingsOfUser(FirebaseAuth.instance.currentUser!.uid)
          .listen((meetings) {
        state = AsyncValue.data(meetings);
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

  void markAsRead(String meetingId) {
    _read(meetingRepositoryProvider).markAsRead(meetingId);
  }
}
