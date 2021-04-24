import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'conversation.dart';
import 'conversation_repository.dart';

final conversationProvider = StateNotifierProvider.autoDispose<
    ConversationController, AsyncValue<List<Conversation>>>((ref) {
  return ConversationController(ref.read);
});

class ConversationController
    extends StateNotifier<AsyncValue<List<Conversation>>> {
  ConversationController(this._read) : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(conversationRepositoryProvider)
          .observeConversationsOfUser(FirebaseAuth.instance.currentUser!.uid)
          .listen((conversations) {
        state = AsyncValue.data(conversations);
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

  void markAsRead(String conversationId) {
    _read(conversationRepositoryProvider).markAsRead(conversationId);
  }
}
