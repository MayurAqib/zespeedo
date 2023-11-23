import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/pages/authentication/login/phone_login_page.dart';
import 'package:zespeedo/pages/authentication/register/phone_register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.jpg'),
                fit: BoxFit.cover,
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
          ),
          Center(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Welcome to',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          height: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 32)),
                  Text('Zaspeedo App',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: themeColor)),
                  const HeightGap(gap: 0.03),
                  MyButton(
                      width: double.infinity,
                      child: Text(
                        'Login',
                        style: ButtonTextStyles.buttonTextStyle,
                      ),
                      onTap: () {
                        changeScreen(context, const PhoneLoginPage());
                      }),
                  const HeightGap(gap: 0.02),
                  MyButton(
                      width: double.infinity,
                      buttonColor: appSecondaryTheme,
                      child: Text(
                        'Register',
                        style: GoogleFonts.barlow(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      onTap: () {
                        changeScreen(context, const PhoneRegisterPage());
                      }),
                  const HeightGap(gap: 0.04),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
