import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/api/post/auth/login_phone_api.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/textform_field.dart';
import 'package:zespeedo/pages/authentication/login/email_login_page.dart';
import 'package:zespeedo/pages/authentication/register/phone_register_page.dart';
import 'package:zespeedo/pages/authentication/utils/auth_bottom_bar.dart';

import '../../../common/naviagtion.dart';
import '../../../provider/auth_provider.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightGap(gap: 0.03),
                  SmallButton(
                      onTap: () {}, alignment: 0.5, icon: Icons.arrow_back_ios),
                  const HeightGap(gap: 0.02),
                  Text(
                    'Welcome back! Glad to see you again',
                    style: GoogleFonts.roboto(
                        height: 0, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const HeightGap(gap: 0.02),
                  Consumer<AuthProviders>(
                      builder: (context, value, child) => Column(
                            children: [
                              MyTextformField(
                                  maxLength: 10,
                                  keyBoard: TextInputType.phone,
                                  controller: value.phoneController,
                                  hintText: 'Enter phone'),
                              const HeightGap(gap: 0.03),
                              MyButton(
                                  width: double.infinity,
                                  child: value.phoneLoginLoader
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : Text(
                                          'Login',
                                          style:
                                              ButtonTextStyles.buttonTextStyle,
                                        ),
                                  onTap: () async {
                                    final auth = Provider.of<AuthProviders>(
                                        context,
                                        listen: false);
                                    value.setphonelogin();
                                    await phoneLoginPostApi(
                                        auth.phoneController.text.trim(),
                                        auth,
                                        context);
                                  })
                            ],
                          )),
                  const HeightGap(gap: 0.05),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade200,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          'Or Login with',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade200,
                      ))
                    ],
                  ),
                  const HeightGap(gap: 0.02),
                  Center(
                    child: MyButton(
                        height: 50,
                        buttonColor: appSecondaryTheme,
                        width: screenWidth(context) * 0.5,
                        onTap: () {
                          replaceScreen(context, const EmailLoginPage());
                        },
                        child: Text(
                          'Email',
                          style: ButtonTextStyles.buttonTextStyle,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AuthBottomBar(
            ontap: () {
              replaceScreen(context, const PhoneRegisterPage());
            },
            message: 'Don\'t have an account?',
            action: 'Register Now'));
  }
}
