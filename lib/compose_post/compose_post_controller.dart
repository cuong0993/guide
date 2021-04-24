import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../post/post.dart';
import '../post/post_repository.dart';
import '../user/user_controller.dart';

final composePostControllerProvider =
    ChangeNotifierProvider.autoDispose<ComposePostController>((ref) {
  return ComposePostController(ref.read);
});

class ComposePostController extends ChangeNotifier {
  final imageUrls = <String>[];
  final tags = <String>[];
  var _text = '';
  var _name = '';
  final Reader _read;
  List<TimeOfDay> timeSlots = [];

  ComposePostController(this._read);

  Future<void> chooseImage(ImageSource imageSource) async {
    // FIXME Image Picker does not work on iOS simulator mac m1
    final file = await ImagePicker().pickImage(source: imageSource);
    if (file != null) {
      imageUrls.add(file.path);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    imageUrls.removeAt(index);
    notifyListeners();
  }

  void addTags(List<String> tags) {
    this.tags.clear();
    this.tags.addAll(tags);
    notifyListeners();
  }

  Future<void> post() async {
    await _read(userProvider).when(data: (user) async {
      final now = DateTime.now();
      final post = Post(
          name: _name,
          userName: user.name,
          userId: user.id,
          userPhotoUrl: user.photoUrl,
          text: _text,
          tags: tags,
          createdDate: DateTime.now(),
          images: imageUrls,
          timeSlots: timeSlots
              .map((timeOfDay) => DateTime(now.year, now.month, now.day,
                  timeOfDay.hour, timeOfDay.minute))
              .toList());
      await _read(postRepositoryProvider).post(post);
    }, loading: () {
      return;
    }, error: (_, __) {
      return;
    });
  }

  void write(String text) {
    _text = text;
  }

  void selectTimeSlots(List<TimeOfDay> timeSlots) {
    this.timeSlots = timeSlots;
    notifyListeners();
  }

  void name(String text) {
    _name = text;
  }
}
