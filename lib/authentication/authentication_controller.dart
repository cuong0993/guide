import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'authentication_state.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationController, AuthenticationState>((ref) {
  return AuthenticationController();
});

class AuthenticationController extends StateNotifier<AuthenticationState> {
  AuthenticationController() : super(AuthenticationState.loading()) {
    Future.microtask(() {
      try {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser == null) {
          state = AuthenticationState.unauthenticated();
        } else {
          state = AuthenticationState.authenticated();
        }
      } catch (_) {
        state = AuthenticationState.unauthenticated();
      }
    });
  }

  final _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      state = AuthenticationState.authenticated();
    } on Exception {
      state = AuthenticationState.unauthenticated();
    }
  }
}
