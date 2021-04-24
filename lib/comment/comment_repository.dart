import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import '../user/user.dart';
import 'comment.dart';

final commentRepositoryProvider =
    Provider<CommentRepository>((ref) => CommentRepository());

class CommentRepository {
  Stream<List<Comment>> observeCommentsOfPost(String postId) {
    return getCommentCollection(postId).snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => Comment.fromJson(doc.data())).toList());
  }

  Stream<List<Comment>> observeCommentsOfUser(String userId) {
    return FirebaseFirestore.instance
        .collectionGroup('comments')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Comment.fromJson(doc.data()))
            .toList());
  }

  Future<void> comment(User user, String postId, String text) async {
    final batch = FirebaseFirestore.instance.batch();
    final postDoc = getPostCollection().doc(postId);
    final commentDoc = getCommentCollection(postId)
        .withConverter<Comment>(
          fromFirestore: (snapshot, options) =>
              Comment.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc();
    final comment = Comment(
        userName: user.name,
        userId: user.id,
        userPhotoUrl: user.photoUrl,
        text: text,
        createdDate: DateTime.now(),
        id: commentDoc.id);
    batch.set(commentDoc, comment);
    batch.set(
        postDoc,
        <String, dynamic>{'commentCount': FieldValue.increment(1)},
        SetOptions(merge: true));
    await batch.commit();
  }
}
