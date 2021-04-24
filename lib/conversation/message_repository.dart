import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import '../user/user.dart';
import 'message.dart';

final messageRepositoryProvider =
    Provider<MessageRepository>((ref) => MessageRepository());

class MessageRepository {
  Stream<List<Message>> observeMessagesOfConversation(String conversationId) {
    return getMessageCollection(conversationId).snapshots().map(
        (querySnapshot) => querySnapshot.docs
            .map((doc) => Message.fromJson(doc.data()))
            .toList());
  }

  Future<void> message(User user, String text, String conversationId) {
    final doc = getMessageCollection(conversationId)
        .withConverter<Message>(
          fromFirestore: (snapshot, options) =>
              Message.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc();
    final message = Message(
        userName: user.name,
        userId: user.id,
        userPhotoUrl: user.photoUrl,
        text: text,
        createdDate: DateTime.now(),
        id: doc.id);
    return doc.set(message.copyWith(id: doc.id));
  }
}
