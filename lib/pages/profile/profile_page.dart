import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/pages/profile/update_profile_page.dart';
import 'package:zespeedo/provider/profile_provider.dart';
import '../../provider/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.03),
        child: Column(
          children: [
            const HeightGap(gap: 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButton(
                    onTap: () {}, alignment: 0.5, icon: Icons.arrow_back_ios),
                Text(
                  'Profile',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 21),
                ),
                const SizedBox(width: 45)
              ],
            ),
            const HeightGap(gap: 0.02),
            FutureBuilder(
                future: Provider.of<ProfileProvider>(context, listen: false)
                    .fetchUserProfile(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: screenWidth(context) * 0.4,
                          width: screenWidth(context) * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(color: themeColor, width: 2),
                              shape: BoxShape.circle,
                              color: Colors.grey.shade200),
                        ),
                      ),
                      const HeightGap(gap: 0.02),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const HeightGap(gap: 0.02),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade200,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ]);
                  }
                  return Consumer<ProfileProvider>(
                      builder: (context, profile, child) {
                    final profileData = profile.userProfileModel.data;
                    return Column(children: [
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
                            height: screenWidth(context) * 0.4,
                            width: screenWidth(context) * 0.4,
                            decoration: BoxDecoration(
                              border: Border.all(color: themeColor, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                  profileData.profilePhoto.isEmpty
                                      ? 'https://cdn-icons-png.flaticon.com/128/428/428933.png'
                                      : profileData.profilePhoto,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  'https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-9361.jpg?size=626&ext=jpg&ga=GA1.1.1867440536.1687323452&semt=ais',
                                  fit: BoxFit.cover,
                                );
                              }, loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // Image is fully loaded, display the original child.
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
                              }),
                            ),
                          ),
                        ),
                        Positioned(
                          right: screenWidth(context) * 0.30,
                          bottom: screenWidth(context) * 0.05,
                          child: InkWell(
                            onTap: () {
                              profile.editingFromProfile();
                              changeScreen(context, const EditProfilePage());
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
                      Text(profileData.name,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      if (profileData.mobile != '')
                        Text(profileData.mobile,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.grey.shade500)),
                      if (profileData.email != '')
                        Text(profileData.email,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.grey.shade500)),
                    ]);
                  });
                }),
            const HeightGap(gap: 0.03),
            profileTabs(
                'https://cdn-icons-png.flaticon.com/128/3059/3059518.png',
                'Profile Details', () {
              // changeScreen(context, const ProfileDetailsPage());
            }),
            profileTabs(
                'https://cdn-icons-png.flaticon.com/128/3524/3524659.png',
                'Settings',
                () {}),
            profileTabs(
                'https://cdn-icons-png.flaticon.com/128/3247/3247250.png',
                'Push Notification', () {
              // changeScreen(context, const PushNotificationSetting());
            }),
            profileTabs(
                'https://cdn-icons-png.flaticon.com/128/7131/7131759.png',
                'Share Access', () {
              // changeScreen(context, const AddPersonToShareAccessPage());
            }),
            const HeightGap(gap: 0.04),
            Divider(
              color: Colors.grey.shade300,
            ),
            const HeightGap(gap: 0.04),
            profileTabs(
                'https://cdn-icons-png.flaticon.com/128/4479/4479623.png',
                'Support',
                () {}),
            Consumer<AuthProviders>(
                builder: (context, value, child) => profileTabs(
                        'https://cdn-icons-png.flaticon.com/128/9347/9347669.png',
                        'Logout', () {
                      value.logout(context);
                    })),
          ],
        ),
      )),
    );
  }

  Widget profileTabs(String icon, String title, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        tileColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.network(
            icon,
            height: 25,
            color: themeColor,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        ),
        trailing: IconButton(
          splashColor: themeColor,
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}

///!!!!!!!!!!!
