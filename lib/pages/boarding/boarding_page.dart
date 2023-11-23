import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/pages/authentication/welcome/welcome_page.dart';
import 'package:zespeedo/provider/auth_provider.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: screenHeight(context) * 0.8,
                child: Consumer<AuthProviders>(
                    builder: (context, value, child) => PageView.builder(
                        onPageChanged: (index) {
                          value.indexValue = index;
                        },
                        controller: controller,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Column(
                              children: [
                                Image.asset(
                                  value.boardingImages[index],
                                  height: screenHeight(context) * 0.7,
                                  width: screenWidth(context),
                                  fit: BoxFit.cover,
                                ),
                                const HeightGap(gap: 0.02),
                                Text(
                                  value.boardingText[index],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.robotoFlex(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )))),
            const HeightGap(gap: 0.02),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  dotHeight: 10, dotWidth: 10, activeDotColor: themeColor),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            bottom: 10,
            right: screenWidth(context) * 0.03,
            left: screenWidth(context) * 0.03),
        child: Consumer<AuthProviders>(
            builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButton(
                        width: 100,
                        height: 50,
                        onTap: () {
                          changeScreen(context, const WelcomePage());
                        },
                        child: Text(
                          'Skip',
                          style: ButtonTextStyles.buttonTextStyle,
                        )),
                    MyButton(
                        height: 50,
                        onTap: () {
                          value.continueToAuthentication(context, controller);
                        },
                        child: Text(
                          'Continue',
                          style: ButtonTextStyles.buttonTextStyle,
                        )),
                  ],
                )),
      ),
    );
  }
}
