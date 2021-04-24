import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../authentication/authentication_controller.dart';
import 'user.dart';
import 'user_repository.dart';

final userProvider =
    StateNotifierProvider<UserController, AsyncValue<User>>((ref) {
  ref.watch(authenticationProvider);
  return UserController(ref.read);
});

class UserController extends StateNotifier<AsyncValue<User>> {
  UserController(this._read) : super(const AsyncValue.loading()) {
    {
      final firebaseUser = firebase.FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        _subscription?.cancel();
        _subscription = _read(userRepositoryProvider)
            .observeUser(firebaseUser.uid)
            .listen((user) async {
          // TODO Push notification for iOS
          final token = await FirebaseMessaging.instance.getToken();
          if (token != null && !user.tokens.contains(token)) {
            _read(userRepositoryProvider).addToken(user.id, token);
          }
          state = AsyncValue.data(user);
        });
      } else {
        state = AsyncValue.error('Unauthenticated');
      }
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
