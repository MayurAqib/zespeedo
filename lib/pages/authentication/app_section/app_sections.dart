import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/pages/tab/tabs_page.dart';

class AppSectionPage extends StatelessWidget {
  const AppSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: NetworkImage(
            //         'https://i.pinimg.com/564x/21/1a/4c/211a4ceebb3578e46047ba222ce46a68.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Image.network(
                'https://i.pinimg.com/564x/21/1a/4c/211a4ceebb3578e46047ba222ce46a68.jpg',
                fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                    Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: Shimmer.fromColors(
                    baseColor: themeColor,
                    highlightColor: Colors.white,
                    child: Stack(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade200,
                          child: Container(
                            height: screenHeight(context),
                            width: screenWidth(context),
                            color: Colors.grey,
                            child: CircularProgressIndicator(
                              color: themeColor,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.white,
                                  Colors.white,
                                ],
                                stops: [0.0, 0.2, 0.7, 1.0],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.white,
                    Colors.white,
                  ],
                  stops: [0.0, 0.2, 0.7, 1.0],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const HeightGap(gap: 0.03),
                  MyButton(
                      width: double.infinity,
                      child: Text(
                        'Shipment',
                        style: ButtonTextStyles.buttonTextStyle,
                      ),
                      onTap: () {
                        // changeScreen(context, const PhoneLoginPage());
                      }),
                  const HeightGap(gap: 0.02),
                  MyButton(
                      width: double.infinity,
                      buttonColor: appSecondaryTheme,
                      child: Text(
                        'Search Supplier',
                        style: GoogleFonts.barlow(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      onTap: () {
                        changeScreen(context, const TabsPage());
                      }),
                  const HeightGap(gap: 0.15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
