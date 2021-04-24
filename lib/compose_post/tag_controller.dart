import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'tag.dart';
import 'tag_repository.dart';

final tagProvider =
    StateNotifierProvider<TagController, AsyncValue<List<Tag>>>((ref) {
  return TagController(ref.read).._loadTag();
});

class TagController extends StateNotifier<AsyncValue<List<Tag>>> {
  TagController(this._read) : super(const AsyncValue.loading());

  final Reader _read;

  Future<void> _loadTag() async {
    final tag = await _read(tagRepositoryProvider).tags();
    state = AsyncValue.data(tag);
  }
}
