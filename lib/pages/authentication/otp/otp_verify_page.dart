import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/dimension.dart';
import 'package:zespeedo/pages/authentication/utils/auth_bottom_bar.dart';
import 'package:zespeedo/provider/auth_provider.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AuthBottomBar(
          message: 'Didn\'t receive any code?', action: 'Resend', ontap: () {}),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeightGap(gap: 0.03),
              Row(
                children: [
                  SmallButton(
                      onTap: () {}, alignment: 0.5, icon: Icons.arrow_back_ios),
                ],
              ),
              const HeightGap(gap: 0.03),
              Text(
                'OTP verification',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    height: 0, fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const HeightGap(gap: 0.01),
              Text(
                'Enter the verification code we just sent you on your phone',
                style: GoogleFonts.roboto(
                    color: const Color(0xff596474),
                    fontWeight: FontWeight.w600),
              ),
              const HeightGap(gap: 0.03),
              Center(
                child: Pinput(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: otpController,
                  focusedPinTheme: PinTheme(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border:
                            const Border(bottom: BorderSide(color: themeColor)),
                        color: themeColor.withOpacity(0.3),
                      )),
                  mainAxisAlignment: MainAxisAlignment.center,
                  length: 6,
                  defaultPinTheme: PinTheme(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: const Border(
                              bottom: BorderSide(color: themeColor)),
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              const HeightGap(gap: 0.05),
              Consumer<AuthProviders>(builder: (context, value, child) {
                if (value.isPhoneLogin == true) {
                  return MyButton(
                      width: double.infinity,
                      child: value.phoneLoginLoader
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text('Verify',
                              style: ButtonTextStyles.buttonTextStyle),
                      onTap: () {});
                } else if (value.isPhoneRegister == true) {
                  return MyButton(
                      width: double.infinity,
                      child: value.verifyOtpLoaderRegister
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text('Verify',
                              style: ButtonTextStyles.buttonTextStyle),
                      onTap: () {
                        value.verifyOtpRegister(context, widget.verificationId,
                            otpController.text.trim());
                      });
                }
                return const SizedBox();
              })
            ],
          ),
        ),
      )),
    );
  }
}
