import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/common/textform_field.dart';
import 'package:zespeedo/pages/authentication/login/email_login_page.dart';
import 'package:zespeedo/pages/authentication/register/phone_register_page.dart';
import 'package:zespeedo/pages/authentication/utils/auth_bottom_bar.dart';
import 'package:zespeedo/provider/auth_provider.dart';

import '../../../common/buttons.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({super.key});

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.06),
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
                            'Hello! Register to get started',
                            style: GoogleFonts.roboto(
                                height: 0,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
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
                                        auth.toggleshowRegisPass();
                                      },
                                      child: Icon(auth.showRegisPass
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined),
                                    )),
                                obscureText: auth.showRegisPass,
                                controller: passController,
                                hintText: 'password'),
                          ),
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
                                        auth.toggleshowConfPass();
                                      },
                                      child: Icon(auth.showRegisConfPass
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined),
                                    )),
                                obscureText: auth.showRegisConfPass,
                                controller: confirmPassController,
                                hintText: 'confirm password'),
                          ),
                          const HeightGap(gap: 0.03),
                          Consumer<AuthProviders>(
                              builder: (context, value, child) => MyButton(
                                  width: double.infinity,
                                  child: value.emailRegisterLoader
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ))
                                      : Text(
                                          'Register',
                                          style:
                                              ButtonTextStyles.buttonTextStyle,
                                        ),
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      value.registerEmail(
                                          emailController.text.trim(),
                                          passController.text.trim(),
                                          confirmPassController.text.trim(),
                                          context);
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  'Or Register with',
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
                          const HeightGap(gap: 0.03),
                          Center(
                            child: MyButton(
                                height: 50,
                                buttonColor: appSecondaryTheme,
                                width: screenWidth(context) * 0.5,
                                onTap: () {
                                  replaceScreen(
                                      context, const PhoneRegisterPage());
                                },
                                child: Text(
                                  'Phone Number',
                                  style: ButtonTextStyles.buttonTextStyle,
                                )),
                          )
                        ]),
                  )))),
      bottomNavigationBar: AuthBottomBar(
          message: 'Already have an account?',
          action: 'Login Now',
          ontap: () {
            replaceScreen(context, const EmailLoginPage());
          }),
    );
  }
}
