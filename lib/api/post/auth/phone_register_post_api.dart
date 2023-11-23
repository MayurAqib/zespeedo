import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zespeedo/common/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/common/toaster.dart';
import 'package:zespeedo/pages/authentication/profile_check/profile_completion_check.dart';
import 'package:zespeedo/provider/auth_provider.dart';

Future phoneRegisterPostApi(
    String phone, AuthProviders authProvider, BuildContext context) async {
  var url = '${ApiConstants.baseUrl}${ApiConstants.phoneRegister}';
  try {
    final response = await http.post(Uri.parse(url), body: {"mobile": phone});
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonData['Message'] == 'Registration Successfully') {
        await authProvider.saveUserIdLocally(jsonData['Register UserId']);
        if (context.mounted) {
          toasterMessage(Colors.green, 'Account created successfully');
          authProvider.stopVerifyOtpLoaderRegister();
          changeScreen(context, const ProfileCompletionCheck());
        }
      } else if (jsonData['Message'] == 'Mobile no is already Registered.') {
        toasterMessage(Colors.red, 'Mobile number already exists');
        authProvider.stopVerifyOtpLoaderRegister();
      }
    } else {
      toasterMessage(Colors.red, 'failed to register..try again');
      authProvider.stopVerifyOtpLoaderRegister();
    }
  } on Exception catch (e) {
    toasterMessage(Colors.red, e.toString());
    authProvider.stopVerifyOtpLoaderRegister();
  }
}
