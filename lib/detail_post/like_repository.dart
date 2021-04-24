import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import '../user/user.dart';
import 'like.dart';

final likeRepositoryProvider =
    Provider<LikeRepository>((ref) => LikeRepository());

class LikeRepository {
  Stream<List<Like>> observeLikes(String postId) {
    return getLikeCollection(postId).snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => Like.fromJson(doc.data())).toList());
  }

  Future<void> unLike(String postId, User user) async {
    final batch = FirebaseFirestore.instance.batch();
    final postDoc = getPostCollection().doc(postId);
    final likeDoc = getLikeCollection(postId)
        .withConverter<Like>(
          fromFirestore: (snapshot, options) => Like.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(user.id);
    batch.delete(likeDoc);
    batch.set(
        postDoc,
        <String, dynamic>{
          'likedUserIds': FieldValue.arrayRemove(<String>[user.id])
        },
        SetOptions(merge: true));
    await batch.commit();
  }

  Future<void> like(String postId, User user) async {
    final batch = FirebaseFirestore.instance.batch();
    final postDoc = getPostCollection().doc(postId);
    final likeDoc = getLikeCollection(postId)
        .withConverter<Like>(
          fromFirestore: (snapshot, options) => Like.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(user.id);
    final like = Like(
      userName: user.name,
      userId: user.id,
      userPhotoUrl: user.photoUrl,
      createdDate: DateTime.now(),
      id: likeDoc.id,
    );
    batch.set(likeDoc, like);
    batch.set(
        postDoc,
        <String, dynamic>{
          'likedUserIds': FieldValue.arrayUnion(<String>[user.id])
        },
        SetOptions(merge: true));
    await batch.commit();
  }
}
