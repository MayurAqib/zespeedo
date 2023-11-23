import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/api/get/profile/user_profile_get_api.dart';
import 'package:zespeedo/model/profile/user_profile_model.dart';
import 'package:zespeedo/provider/auth_provider.dart';

class ProfileProvider extends ChangeNotifier {
  String? profileImage;
  setProfileImageNull() {
    profileImage = null;
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImage = image.path;
      notifyListeners();
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      profileImage = image.path;
      notifyListeners();
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  //! SELECCT date of birth

  Future<void> selectDateOfBirth(
      BuildContext context, TextEditingController dobController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      dobController.text = formattedDate; // Update the controller directly
      notifyListeners();
    }
  }

  bool editFromProfile = false;
  editingFromProfile() {
    editFromProfile = true;
    notifyListeners();
  }

  editingFromRegister() {
    editFromProfile = false;
    notifyListeners();
  }

  //! fetching the user data
  UserProfileModel _userProfileModel = UserProfileModel(
      status: '',
      message: '',
      data: UserProfile(
          name: '', email: '', mobile: '', dateOfBirth: '', profilePhoto: ''));
  UserProfileModel get userProfileModel => _userProfileModel;
  fetchUserProfile(BuildContext context) async {
    final auth = Provider.of<AuthProviders>(context, listen: false);
    final resposne = await userProfileGetApi(auth);
    _userProfileModel = resposne;
    notifyListeners();
  }
}
