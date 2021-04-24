import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../user/user.dart';
import '../utils/validation.dart';
import 'edit_profile_controller.dart';
import 'text_form_builder.dart';

class EditProfilePage extends HookConsumerWidget {
  final User user;

  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final editProfileController =
        ref.watch(editProfileControllerProvider(user));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: GestureDetector(
                onTap: () {
                  formKey.currentState!.save();
                  if (!formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Please fix the errors in red before submitting.'),
                    ));
                  } else {
                    editProfileController.editProfile();
                  }
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: GestureDetector(
              onTap: () => editProfileController.pickImage(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: editProfileController.imgLink != null
                    ? Padding(
                        padding: const EdgeInsets.all(1),
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              NetworkImage(editProfileController.imgLink!),
                        ),
                      )
                    : editProfileController.image == null
                        ? Padding(
                            padding: const EdgeInsets.all(1),
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(
                                  editProfileController.user.photoUrl),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(1),
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage:
                                  FileImage(editProfileController.image!),
                            ),
                          ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormBuilder(
                    enabled: true,
                    initialValue: editProfileController.user.name,
                    prefix: Icons.account_circle_outlined,
                    hintText: 'Username',
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateName,
                    onSaved: (val) {
                      editProfileController.setUsername(val);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormBuilder(
                    initialValue: 'widget.user.country',
                    enabled: true,
                    prefix: Icons.location_on_outlined,
                    hintText: 'Country',
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateName,
                    onSaved: (val) {
                      editProfileController.setCountry(val);
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    maxLines: null,
                    initialValue: 'widget.user.bio',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length > 1000) {
                        return 'Bio must be short';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      editProfileController.setBio(val!);
                    },
                    onChanged: (val) {
                      editProfileController.setBio(val);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
