import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zespeedo/common/api_constants.dart';
import 'package:zespeedo/model/profile/user_profile_model.dart';
import 'package:zespeedo/provider/auth_provider.dart';

Future<UserProfileModel> userProfileGetApi(AuthProviders auth) async {
  var userId = await auth.loadUserId();
  var url = '${ApiConstants.baseUrl}${ApiConstants.userProfile}?userId=$userId';
  debugPrint('profle url is -- $url');

  try {
    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);

    debugPrint('profle reposne is -- $jsonData');
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(jsonData);
    } else {
      throw Exception('failed to load user profile');
    }
  } on Exception catch (e) {
    throw Exception(e.toString());
  }
}
