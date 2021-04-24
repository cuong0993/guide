import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<Map<String, dynamic>> getMeetingCollection() =>
    FirebaseFirestore.instance.collection('meetings');

CollectionReference<Map<String, dynamic>> getUserCollection() =>
    FirebaseFirestore.instance.collection('users');

CollectionReference<Map<String, dynamic>> getTagCollection() =>
    FirebaseFirestore.instance.collection('tags');

CollectionReference<Map<String, dynamic>> getConversationCollection() =>
    FirebaseFirestore.instance.collection('conversations');

CollectionReference<Map<String, dynamic>> getMessageCollection(
        String conversationId) =>
    getConversationCollection().doc(conversationId).collection('messages');

CollectionReference<Map<String, dynamic>> getPostCollection() =>
    FirebaseFirestore.instance.collection('posts');

CollectionReference<Map<String, dynamic>> getCommentCollection(String postId) =>
    getPostCollection().doc(postId).collection('comments');

CollectionReference<Map<String, dynamic>> getLikeCollection(String postId) =>
    getPostCollection().doc(postId).collection('likes');
