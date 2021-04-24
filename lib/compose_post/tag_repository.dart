import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firebase_collection.dart';
import 'tag.dart';

final tagRepositoryProvider =
    Provider<TagsRepositoryImpl>((ref) => TagsRepositoryImpl());

class TagsRepositoryImpl {
  Future<List<Tag>> tags() async {
    return getTagCollection().get().then((querySnapshot) =>
        querySnapshot.docs.map((e) => Tag.fromJson(e.data())).toList());
  }
}
