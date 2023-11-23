import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/common/textform_field.dart';
import 'package:zespeedo/pages/authentication/login/phone_login_page.dart';
import 'package:zespeedo/pages/authentication/register/email_register_page.dart';
import 'package:zespeedo/pages/authentication/utils/auth_bottom_bar.dart';
import 'package:zespeedo/provider/auth_provider.dart';

import '../../../common/dimension.dart';

class PhoneRegisterPage extends StatefulWidget {
  const PhoneRegisterPage({super.key});

  @override
  State<PhoneRegisterPage> createState() => _PhoneRegisterPageState();
}

class _PhoneRegisterPageState extends State<PhoneRegisterPage> {
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
                    'Hello! Register to get started',
                    style: GoogleFonts.roboto(
                        height: 0, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const HeightGap(gap: 0.02),
                  Consumer<AuthProviders>(
                      builder: (context, value, child) => Column(
                            children: [
                              MyTextformField(
                                  keyBoard: TextInputType.phone,
                                  controller: value.phoneController,
                                  maxLength: 10,
                                  hintText: 'Enter phone'),
                              const HeightGap(gap: 0.03),
                              MyButton(
                                  width: double.infinity,
                                  child: value.phoneRegisterLoader
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : Text(
                                          'Register',
                                          style:
                                              ButtonTextStyles.buttonTextStyle,
                                        ),
                                  onTap: () {
                                    value.setphoneRegister();
                                    value.phoneAuthentication(context);
                                  }),
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
                          'Or Register with',
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
                  const HeightGap(gap: 0.03),
                  Center(
                    child: MyButton(
                        height: 50,
                        buttonColor: appSecondaryTheme,
                        width: screenWidth(context) * 0.5,
                        onTap: () {
                          replaceScreen(context, const EmailRegisterPage());
                        },
                        child: Text(
                          'Email',
                          style: ButtonTextStyles.buttonTextStyle,
                        )),
                  ),
                  const HeightGap(gap: 0.03),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AuthBottomBar(
            message: 'Already have an account?',
            action: 'Login Now',
            ontap: () {
              replaceScreen(context, const PhoneLoginPage());
            }));
  }
}
