import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import 'post.dart';

final postRepositoryProvider =
    Provider<PostRepository>((ref) => PostRepository());

class PostRepository {
  Stream<List<Post>> observePosts() {
    return getPostCollection().snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => Post.fromJson(doc.data())).toList());
  }

  Stream<List<Post>> observePostsOfUser(String userId) {
    return getPostCollection()
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Post.fromJson(doc.data()))
            .toList());
  }

  Future<void> post(Post post) async {
    final imageStorageUrls = <String>[];
    final doc = getPostCollection()
        .withConverter<Post>(
          fromFirestore: (snapshot, options) => Post.fromJson(snapshot.data()!),
          toFirestore: (data, options) => data.toJson(),
        )
        .doc();
    var index = 0;
    await Future.wait(post.images.map((url) {
      final path = 'posts/${doc.id}/$index.${url.split('.').last}';
      imageStorageUrls.add(path);
      index++;
      return FirebaseStorage.instance.ref(path).putFile(File(url));
    }));
    await doc.set(post.copyWith(id: doc.id, images: imageStorageUrls));
  }
}
