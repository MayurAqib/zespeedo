import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zespeedo/common/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/common/toaster.dart';
import 'package:zespeedo/pages/authentication/profile_check/profile_completion_check.dart';
import 'package:zespeedo/provider/auth_provider.dart';

Future emailLoginPostApi(
    String email, AuthProviders authProvider, BuildContext context) async {
  var url = '${ApiConstants.baseUrl}${ApiConstants.emailLogin}';
  try {
    final response = await http.post(Uri.parse(url), body: {"email": email});
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonData['message'] == 'Login successful') {
        await authProvider.saveUserIdLocally(jsonData['Id']);
        if (context.mounted) {
          toasterMessage(Colors.green, 'Login successfully');
          authProvider.stopEmailLoader();
          changeScreen(context, const ProfileCompletionCheck());
        }
      } else if (jsonData['Message'] == 'Invalid Credentials.Try Again!!') {
        toasterMessage(Colors.red, 'Invalid email');
        authProvider.stopEmailLoader();
      }
    } else {
      toasterMessage(Colors.red, 'failed to login..try again');
      authProvider.stopEmailLoader();
    }
  } on Exception catch (e) {
    toasterMessage(Colors.red, e.toString());
    authProvider.stopEmailLoader();
  }
}
//!{"status":"true","message":"Login successful","Id":24,"Name":null,"Email":"coder@gmail.com","Mobile no":null}
//!{"Status":"False","Message":"Invalid Credentials.Try Again!!"}