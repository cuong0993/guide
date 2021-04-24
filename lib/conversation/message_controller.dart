import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user/user_controller.dart';
import 'message.dart';
import 'message_repository.dart';

final messageProvider = StateNotifierProvider.autoDispose
    .family<MessageController, AsyncValue<List<Message>>, String>(
        (ref, conversationId) {
  return MessageController(ref.read, conversationId);
});

class MessageController extends StateNotifier<AsyncValue<List<Message>>> {
  final String _conversationId;

  MessageController(this._read, this._conversationId)
      : super(const AsyncValue.loading()) {
    {
      _subscription?.cancel();
      _subscription = _read(messageRepositoryProvider)
          .observeMessagesOfConversation(_conversationId)
          .listen((messages) {
        messages.sort((a, b) {
          return a.createdDate.compareTo(b.createdDate);
        });
        state = AsyncValue.data(messages);
      });
    }
  }

  StreamSubscription? _subscription;
  final Reader _read;

  Future<void> message(String text) async {
    await _read(userProvider).when(data: (user) async {
      await _read(messageRepositoryProvider)
          .message(user, text, _conversationId);
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
