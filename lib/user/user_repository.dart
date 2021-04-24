import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import 'user.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());

class UserRepository {
  Stream<User> observeUser(String userId) {
    return getUserCollection()
        .doc(userId)
        .snapshots()
        .where((event) => event.exists)
        .map((event) => User.fromJson(event.data()!));
  }

  void update(String userId, String name, String photoUrl) {
    getUserCollection()
        .doc(userId)
        .update(<String, dynamic>{'name': name, 'photoUrl': photoUrl});
  }

  void addToken(String userId, String token) {
    getUserCollection().doc(userId).update(<String, dynamic>{
      'tokens': FieldValue.arrayUnion(<String>[token])
    });
  }

  Future<User> getUser(String userId) {
    return getUserCollection()
        .doc(userId)
        .get()
        .then((event) => User.fromJson(event.data()!));
  }
}
