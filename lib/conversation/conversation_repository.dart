import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import 'conversation.dart';

final conversationRepositoryProvider =
    Provider<ConversationRepository>((ref) => ConversationRepository());

class ConversationRepository {
  Stream<List<Conversation>> observeConversationsOfUser(String userId) {
    return getConversationCollection()
        .where('participantIds.$userId', isEqualTo: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Conversation.fromJson(doc.data()))
            .toList());
  }

  Future<Conversation?> getConversationWithUser(
      String userId1, String userId2) {
    return getConversationCollection()
        .where('participantCount', isEqualTo: 2)
        .where('participantIds.$userId1', isEqualTo: true)
        .where('participantIds.$userId2', isEqualTo: true)
        .get()
        .then((event) {
      if (event.docs.isEmpty) {
        return null;
      } else {
        return Conversation.fromJson(event.docs.first.data());
      }
    });
  }

  Future<Conversation> createConversationWithUser(
      String userId1, String userId2) async {
    final doc = getConversationCollection().doc().withConverter<Conversation>(
          fromFirestore: (snapshot, options) =>
              Conversation.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
    final conversation = Conversation(participantIds: {
      userId1: true,
      userId2: true
    }, lastViews: {
      userId1: DateTime.now().millisecondsSinceEpoch,
      userId2: DateTime.now().millisecondsSinceEpoch
    }, id: doc.id, participantCount: 2);
    await doc.set(conversation);
    return conversation;
  }

  void markAsRead(String conversationId) {
    getConversationCollection().doc(conversationId).update(<String, dynamic>{
      'lastViews.${FirebaseAuth.instance.currentUser!.uid}':
          DateTime.now().millisecondsSinceEpoch
    });
  }
}
