import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zespeedo/common/api_constants.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/common/toaster.dart';
import 'package:zespeedo/pages/authentication/app_section/app_sections.dart';
import 'package:zespeedo/pages/tab/tabs_page.dart';
import 'package:zespeedo/provider/auth_provider.dart';
import 'package:zespeedo/provider/profile_provider.dart';

Future<void> updateProfileApi(
    AuthProviders auth,
    ProfileProvider profile,
    String name,
    String email,
    String mobile,
    String dob,
    String photo,
    BuildContext context) async {
  var userId = await auth.loadUserId();
  var url = '${ApiConstants.baseUrl}${ApiConstants.editProfile}?userId=$userId';

  try {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    if (photo != '') {
      var file = await http.MultipartFile.fromPath('user_profile_photo', photo);

      request.files.add(file);
    }
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['mobile'] = mobile;
    request.fields['dob'] = dob;
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    dynamic jsonData = jsonDecode(responseBody);
    debugPrint('this is post profile resposne $jsonData');
    if (response.statusCode == 200) {
      if (jsonData['Message'] == 'Data Updated Successfully') {
        toasterMessage(Colors.green, 'Profile Update Successfully');
        if (profile.editFromProfile) {
          if (context.mounted) {
            changeScreen(context, const TabsPage());
            profile.editingFromRegister();
          }
        } else {
          if (context.mounted) {
            changeScreen(context, const AppSectionPage());
          }
        }
      }
    } else {
      toasterMessage(Colors.red, 'Profile Update Failed');
    }
  } on Exception catch (e) {
    toasterMessage(Colors.red, 'Server error: $e');
  }
}
