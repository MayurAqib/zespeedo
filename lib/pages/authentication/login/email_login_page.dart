import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/common/textform_field.dart';
import 'package:zespeedo/pages/authentication/login/phone_login_page.dart';
import 'package:zespeedo/pages/authentication/register/email_register_page.dart';
import 'package:zespeedo/pages/authentication/utils/auth_bottom_bar.dart';
import 'package:zespeedo/provider/auth_provider.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final emailController = TextEditingController();

  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.06),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightGap(gap: 0.03),
                    SmallButton(
                        onTap: () {},
                        alignment: 0.5,
                        icon: Icons.arrow_back_ios),
                    const HeightGap(gap: 0.02),
                    Text(
                      'Welcome back! Glad to see you again',
                      style: GoogleFonts.roboto(
                          height: 0, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const HeightGap(gap: 0.02),
                    MyTextformField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'email can\'t be empty';
                          }
                          return null;
                        },
                        controller: emailController,
                        hintText: 'Enter email'),
                    const SizedBox(height: 10),
                    Consumer<AuthProviders>(
                      builder: (context, auth, child) => MyTextformField(
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'password can\'t be empty';
                            } else if (value.trim().length < 6) {
                              return 'password must be 6 digit character';
                            }
                            return null;
                          },
                          showPass: Container(
                              height: 10,
                              width: 10,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  auth.toggleshowLoginPass();
                                },
                                child: Icon(auth.showLoginPass
                                    ? Icons.remove_red_eye
                                    : Icons.remove_red_eye_outlined),
                              )),
                          obscureText: auth.showLoginPass,
                          controller: passController,
                          hintText: 'Enter password'),
                    ),
                    const HeightGap(gap: 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const HeightGap(gap: 0.03),
                    Consumer<AuthProviders>(
                        builder: (context, value, child) => MyButton(
                            width: double.infinity,
                            child: value.emailLoginLoader
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white))
                                : Text(
                                    'Login',
                                    style: ButtonTextStyles.buttonTextStyle,
                                  ),
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                value.loginEmail(emailController.text.trim(),
                                    passController.text.trim(), context);
                              }
                            })),
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
                            'Or Login with phone number',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
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
                            replaceScreen(context, const PhoneLoginPage());
                          },
                          child: Text(
                            'Phone Number',
                            style: ButtonTextStyles.buttonTextStyle,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: AuthBottomBar(
            ontap: () {
              replaceScreen(context, const EmailRegisterPage());
            },
            message: 'Don\'t have an account?',
            action: 'Register Now'));
  }
}
