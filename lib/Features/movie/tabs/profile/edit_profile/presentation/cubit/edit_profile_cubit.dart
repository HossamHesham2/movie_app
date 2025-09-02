import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  User? user = FirebaseAuth.instance.currentUser;
  late TextEditingController nameController = TextEditingController();
  late final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditProfileCubit() : super(EditProfileInitial());

  static EditProfileCubit get(BuildContext context) =>
      BlocProvider.of<EditProfileCubit>(context);

  Future<void> editProfile({String? profileImage}) async {
    if (!formKey.currentState!.validate()) {
      emit(EditProfileFailure('Validation failed'));
      return;
    }

    try {
      emit(EditProfileLoading());

      if (user == null) {
        emit(EditProfileFailure('User not found'));
        return;
      }

      final phone = phoneController.text.trim();
      final name = nameController.text.trim();

      await user?.updateDisplayName(name);

      if (profileImage != null && profileImage.isNotEmpty) {
        await user?.updatePhotoURL(profileImage);
      }

      await user?.reload();

      Map<String, dynamic> updatedData = {'name': name, 'phone': phone};

      if (profileImage != null && profileImage.isNotEmpty) {
        updatedData['profileImage'] = profileImage;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update(updatedData);

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailure(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(DeleteProfileLoading());
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.delete();
        emit(DeleteProfileSuccess());

        print("Account deleted successfully");
      } else {
        emit(DeleteProfileFailure("No user is currently signed in."));

        print("No user is currently signed in.");
      }
    } catch (e) {
      emit(DeleteProfileFailure("Error deleting account: $e"));
    }
  }
}
