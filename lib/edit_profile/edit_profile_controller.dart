import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../user/user.dart';

final editProfileControllerProvider = ChangeNotifierProvider.autoDispose
    .family<EditProfileController, User>((ref, user) {
  return EditProfileController(user);
});

class EditProfileController extends ChangeNotifier {
  String? imgLink;
  final User user;
  File? image;

  EditProfileController(this.user);

  void editProfile() {}

  Future<void> pickImage() async {
    notifyListeners();
    try {
      final picker = ImagePicker();

      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      notifyListeners();
    }
  }

  void setCountry(String val) {
    notifyListeners();
  }

  void setBio(String val) {
    notifyListeners();
  }

  void setUsername(String val) {
    notifyListeners();
  }
}
