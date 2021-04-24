import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import '../user/user.dart';
import 'meeting.dart';

final meetingRepositoryProvider =
    Provider<MeetingRepository>((ref) => MeetingRepository());

class MeetingRepository {
  Stream<List<Meeting>> observeMeetingsOfUser(String userId) {
    return getMeetingCollection()
        .where('participantIds.$userId', isEqualTo: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Meeting.fromJson(doc.data()))
            .toList());
  }

  Future<Meeting?> getMeetingWithUser(String userId1, String userId2) {
    return getMeetingCollection()
        .where('participantCount', isEqualTo: 2)
        .where('participantIds.$userId1', isEqualTo: true)
        .where('participantIds.$userId2', isEqualTo: true)
        .get()
        .then((event) {
      if (event.docs.isEmpty) {
        return null;
      } else {
        return Meeting.fromJson(event.docs.first.data());
      }
    });
  }

  Future<Meeting> createMeetingWithUser(
      User user1, User user2, DateTime time, String name) async {
    final doc = getMeetingCollection().doc().withConverter<Meeting>(
          fromFirestore: (snapshot, options) =>
              Meeting.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
    final meeting = Meeting(
        participantIds: {user1.id: true, user2.id: true},
        participantNames: {user1.id: user1.name, user2.id: user2.name},
        participantUrls: {user1.id: user1.photoUrl, user2.id: user2.photoUrl},
        createdUserId: user1.id,
        id: doc.id,
        name: name,
        time: time,
        participantCount: 2);
    await doc.set(meeting);
    return meeting;
  }

  void markAsRead(String meetingId) {
    getMeetingCollection().doc(meetingId).update(<String, dynamic>{
      'lastViews.${firebase.FirebaseAuth.instance.currentUser!.uid}':
          DateTime.now().millisecondsSinceEpoch
    });
  }
}
