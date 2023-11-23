import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  final String status;
  final String message;
  final UserProfile data;

  UserProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        status: json["Status"] ?? '',
        message: json["Message"] ?? '',
        data: UserProfile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "data": data.toJson(),
      };
}

class UserProfile {
  final String name;
  final String email;
  final String mobile;
  final String dateOfBirth;
  final String profilePhoto;

  UserProfile({
    required this.name,
    required this.email,
    required this.mobile,
    required this.dateOfBirth,
    required this.profilePhoto,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        name: json["Name"] ?? '',
        email: json["Email"] ?? '',
        mobile: json["Mobile"] ?? '',
        dateOfBirth: json["Date of Birth"] ?? DateTime.now().toString(),
        profilePhoto: json["Profile Photo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Email": email,
        "Mobile": mobile,
        "Date of Birth": dateOfBirth,
        "Profile Photo": profilePhoto,
      };
}
