import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/pages/authentication/app_section/app_sections.dart';
import 'package:zespeedo/pages/profile/update_profile_page.dart';
import 'package:zespeedo/provider/profile_provider.dart';

class ProfileCompletionCheck extends StatelessWidget {
  const ProfileCompletionCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: Provider.of<ProfileProvider>(context, listen: false)
            .fetchUserProfile(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: SizedBox(
                    height: screenHeight(context) * 0.03,
                    child: LoadingIndicator(
                        indicatorType: Indicator.lineScale,
                        colors: [Colors.grey.shade300],
                        strokeWidth: 2,
                        pathBackgroundColor: Colors.black)));
          }
          return Consumer<ProfileProvider>(builder: (context, value, child) {
            final profile = value.userProfileModel.data;
            if (profile.name == '') {
              return const EditProfilePage();
            } else {
              return const AppSectionPage();
            }
          });
        },
      ),
    );
  }
}
