import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zespeedo/api/post/profile/profile_update_api.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/textform_field.dart';
import 'package:zespeedo/pages/profile/utils/open_camera_gallery_dialog.dart';
import 'package:zespeedo/provider/auth_provider.dart';
import 'package:zespeedo/provider/profile_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  @override
  void initState() {
    super.initState();
    final profile = Provider.of<ProfileProvider>(context, listen: false);
    profile.setProfileImageNull();
    nameController.text = profile.userProfileModel.data.name;
    emailController.text = profile.userProfileModel.data.email;
    phoneController.text = profile.userProfileModel.data.mobile;
    dobController.text = profile.userProfileModel.data.dateOfBirth;
  }

  bool updateLoader = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: screenWidth(context) * 0.06,
              right: screenWidth(context) * 0.06,
              bottom: 10),
          child: updateLoader
              ? Shimmer.fromColors(
                  baseColor: themeColor,
                  highlightColor: Colors.white,
                  child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child:
                          const CircularProgressIndicator(color: Colors.teal)),
                )
              : MyButton(
                  child: Text(
                    'Save',
                    style: ButtonTextStyles.buttonTextStyle,
                  ),
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        updateLoader = true;
                      });
                      await updateProfileApi(
                          Provider.of<AuthProviders>(context, listen: false),
                          Provider.of<ProfileProvider>(context, listen: false),
                          nameController.text.trim(),
                          emailController.text.trim(),
                          phoneController.text.trim(),
                          dobController.text,
                          Provider.of<ProfileProvider>(context, listen: false)
                                  .profileImage ??
                              '',
                          context);
                      setState(() {
                        updateLoader = false;
                      });
                    }
                  }),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.03),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightGap(gap: 0.02),
                  SmallButton(
                      onTap: () {}, alignment: 0.5, icon: Icons.arrow_back_ios),
                  const HeightGap(gap: 0.02),
                  Consumer<ProfileProvider>(builder: (context, profile, child) {
                    final profileData = profile.userProfileModel.data;
                    return Column(
                      children: [
                        Stack(children: [
                          SizedBox(
                            height: screenWidth(context) * 0.43,
                            width: double.infinity,
                          ),
                          Positioned(
                            top: 0,
                            left: screenWidth(context) * 0.27,
                            right: screenWidth(context) * 0.27,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              height: screenWidth(context) * 0.4,
                              width: screenWidth(context) * 0.4,
                              decoration: const BoxDecoration(
                                color: themeColor,
                                shape: BoxShape.circle,
                              ),
                              child: profile.profileImage == null
                                  ? ClipOval(
                                      child: Image.network(
                                      profileData.profilePhoto.isEmpty
                                          ? 'https://cdn-icons-png.flaticon.com/128/428/428933.png'
                                          : profileData.profilePhoto,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.network(
                                          'https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-9361.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=ais',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: Shimmer.fromColors(
                                              baseColor: themeColor,
                                              highlightColor: Colors.white,
                                              child: CircularProgressIndicator(
                                                color: themeColor,
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        (loadingProgress
                                                                .expectedTotalBytes ??
                                                            1)
                                                    : null,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ))
                                  : CircleAvatar(
                                      radius: screenWidth(context) * 0.4,
                                      backgroundImage: FileImage(
                                          File(profile.profileImage!)),
                                    ),
                            ),
                          ),
                          Positioned(
                            right: screenWidth(context) * 0.30,
                            bottom: screenWidth(context) * 0.05,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const OpenCameraGalleryDailog());
                              },
                              child: const CircleAvatar(
                                radius: 17,
                                backgroundColor: themeColor,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          )
                        ]),
                        const HeightGap(gap: 0.02),
                        MyTextformField(
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter Name';
                              } else if (value.trim().length < 3) {
                                return 'Name must be 3 character long';
                              } else {
                                return null;
                              }
                            },
                            controller: nameController,
                            hintText: 'Enter name'),
                        const SizedBox(height: 15),
                        MyTextformField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              String emailPattern =
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                              RegExp regExp = RegExp(emailPattern);
                              if (!regExp.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            enabled: profileData.email == '',
                            controller: emailController,
                            hintText: profileData.email == ''
                                ? 'Enter email'
                                : profileData.email),
                        const SizedBox(height: 15),
                        MyTextformField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Date of Birth';
                              }

                              RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

                              if (!dateRegex.hasMatch(value)) {
                                return 'Invalid date format. Please use the format: 20/01/2000';
                              }

                              try {
                                DateTime parsedDate =
                                    DateFormat('dd/MM/yyyy').parseStrict(value);
                                String formattedDate =
                                    DateFormat('dd/MM/yyyy').format(parsedDate);

                                if (value != formattedDate) {
                                  return 'Invalid date. Please enter a valid date.';
                                }

                                return null;
                              } catch (e) {
                                return 'Invalid date. Please enter a valid date.';
                              }
                            },
                            showPass: GestureDetector(
                                onTap: () async {
                                  await profile.selectDateOfBirth(
                                      context, dobController);
                                },
                                child: const Icon(Icons.calendar_today,
                                    color: themeColor)),
                            controller: dobController,
                            hintText: 'Select Date of Birth'),
                        const SizedBox(height: 15),
                        MyTextformField(
                            enabled: profileData.mobile == '',
                            maxLength: 10,
                            keyBoard: TextInputType.phone,
                            controller: phoneController,
                            hintText: 'Enter phone number')
                      ],
                    );
                  })
                ],
              ),
            ),
          )),
        ));
  }
}
