import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zespeedo/common/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:zespeedo/common/toaster.dart';
import 'package:zespeedo/provider/auth_provider.dart';

Future phoneLoginPostApi(
    String phone, AuthProviders authProvider, BuildContext context) async {
  authProvider.startPhoneLoginLoader();
  var url = '${ApiConstants.baseUrl}${ApiConstants.phoneLogin}';
  try {
    final response = await http.post(Uri.parse(url), body: {"mobile": phone});
    final jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonData['message'] == 'Login successful') {
        await authProvider.saveUserIdLocally(jsonData['Id']);
        if (context.mounted) {
          authProvider.phoneLoginAuthentication(context);
        }
      } else if (jsonData['Message'] == 'Invalid Credentials.Try Again!!') {
        toasterMessage(Colors.red, 'Mobile number does not exist');
        authProvider.stopPhoneLoginLoader();
      }
    } else {
      toasterMessage(Colors.red, 'failed to login..try again');
      authProvider.stopPhoneLoginLoader();
    }
  } on Exception catch (e) {
    toasterMessage(Colors.red, e.toString());
    authProvider.stopPhoneLoginLoader();
  }
}
//!{"status":"true","message":"Login successful","Id":39,"Name":null,"Email":null,"Mobile no":"8267881733"}
//!{"Status":"False","Message":"Invalid Credentials.Try Again!!"}