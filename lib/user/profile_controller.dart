import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../authentication/authentication_controller.dart';
import 'user.dart';
import 'user_repository.dart';

final profileProvider =
    StateNotifierProvider.family<ProfileController, AsyncValue<User>, String>(
        (ref, userId) {
  ref.watch(authenticationProvider);
  return ProfileController(ref.read, userId);
});

class ProfileController extends StateNotifier<AsyncValue<User>> {
  final String userId;

  ProfileController(this._read, this.userId)
      : super(const AsyncValue.loading()) {
    _read(userRepositoryProvider).getUser(userId).then((user) {
      state = AsyncValue.data(user);
    });
  }

  final Reader _read;
}
