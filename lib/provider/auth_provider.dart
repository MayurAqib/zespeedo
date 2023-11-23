// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zespeedo/api/post/auth/email_register_post_api.dart';
import 'package:zespeedo/api/post/auth/login_email_post_api.dart';
import 'package:zespeedo/api/post/auth/phone_register_post_api.dart';
import 'package:zespeedo/pages/authentication/otp/otp_verify_page.dart';
import 'package:zespeedo/pages/authentication/profile_check/profile_completion_check.dart';

import '../common/naviagtion.dart';
import '../common/toaster.dart';
import '../pages/authentication/welcome/welcome_page.dart';

class AuthProviders extends ChangeNotifier {
  //!user id and shared preferences code
  Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;
    return isFirstTime;
  }

  //!save UserId locally
  Future<void> saveUserIdLocally(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId);
  }

  //!load userId
  Future<int?> loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user_id");
  }

  //! clear userId
  clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user_id");
  }

  //! App open before
  void setAppOpened() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('first_time', false);
  }

//! already login
  bool alreadyLogin = false;
  gettingId() async {
    var id = await loadUserId();
    if (id != null) {
      alreadyLogin = true;
      notifyListeners();
    }
  }

//todo: borading screens related logic start here
  List boardingImages = [
    'assets/images/board1.jpg',
    'assets/images/board2.jpg',
    'assets/images/board3.jpg',
  ];
  List boardingText = [
    'Find the best products in one place!',
    'Best manufacturers around the world!',
    'Track your shipment in real time!',
  ];
  //!
  int _indexValue = 0;
  int get indexValue => _indexValue;
  set indexValue(int index) {
    _indexValue = index;
    notifyListeners();
  }

  continueToAuthentication(BuildContext context, PageController controller) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (indexValue < 2) {
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        changeScreen(context, const WelcomePage());
      }
    });
  }

  //todo: borading screens related logic ends here
  //!main authentication starts here
  // setting up the routing for the authentications
  bool showEmailLoginPage = false;
  bool toggleRegisterLogin() {
    showEmailLoginPage = !showEmailLoginPage;
    notifyListeners();
    return showEmailLoginPage;
  }

  bool showPhoneLoginPage = false;
  bool togglePhoneEmail() {
    showPhoneLoginPage = !showPhoneLoginPage;
    notifyListeners();
    return showPhoneLoginPage;
  }

  //! show and hide pass word
  bool showLoginPass = false;
  void toggleshowLoginPass() {
    showLoginPass = !showLoginPass;
    notifyListeners();
  }

  bool showRegisPass = false;
  void toggleshowRegisPass() {
    showRegisPass = !showRegisPass;
    notifyListeners();
  }

  bool showRegisConfPass = false;
  void toggleshowConfPass() {
    showRegisConfPass = !showRegisConfPass;
    notifyListeners();
  }

//! firebase register user using email
  bool emailRegisterLoader = false;
  emailLoaderStop() {
    emailRegisterLoader = false;
    notifyListeners();
  }

  registerEmail(
      String email, String pass, String cPass, BuildContext context) async {
    final auth = Provider.of<AuthProviders>(context, listen: false);
    if (pass != cPass) {
      toasterMessage(Colors.red, 'passwords do not match');
      return;
    }
    try {
      emailRegisterLoader = true;
      notifyListeners();
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);

      if (user != null) {
        if (context.mounted) {
          await emailRegisterPostApi(auth, email, context);
        }
      }
    } on FirebaseAuthException catch (e) {
      toasterMessage(Colors.red, e.toString());
    }
  }

//! firebase login user using email
  bool emailLoginLoader = false;
  stopEmailLoader() {
    emailLoginLoader = false;
    notifyListeners();
  }

  loginEmail(String email, String pass, BuildContext context) async {
    emailLoginLoader = true;
    notifyListeners();
    final auth = Provider.of<AuthProviders>(context, listen: false);
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      if (user != null) {
        if (context.mounted) {
          await emailLoginPostApi(email, auth, context);
        }
      }
    } on FirebaseAuthException catch (e) {
      toasterMessage(Colors.red, e.toString());
      stopEmailLoader();
    }
  }

  //! firebase and server log out
  bool logoutLoader = false;

  logout(BuildContext context) async {
    logoutLoader = true;
    notifyListeners();
    await FirebaseAuth.instance.signOut();
    logoutLoader = false;
    await clearToken();
    notifyListeners();
    var id = await loadUserId();
    if (id == null) {
      if (context.mounted) {
        toasterMessage(Colors.green, 'Logout successfully');
        changeScreen(context, const WelcomePage());
      }
    }
  }

  bool isPhoneLogin = true;
  bool isPhoneRegister = false;
  setphonelogin() {
    isPhoneLogin = true;
    isPhoneRegister = false;
    notifyListeners();
  }

  setphoneRegister() {
    isPhoneLogin = false;
    isPhoneRegister = true;
    notifyListeners();
  }

  //! phone authentication
  bool phoneRegisterLoader = false;
  stopPhoneRegisterLoader() {
    phoneRegisterLoader = false;
    notifyListeners();
  }

  final phoneController = TextEditingController();
  void phoneAuthentication(BuildContext context) async {
    phoneRegisterLoader = true;
    notifyListeners();
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phoneController.text.trim()}',
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          toasterMessage(Colors.red, e.message.toString());
          stopPhoneRegisterLoader();
        },
        codeSent: (String verificationId, int? token) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpVerifyPage(
                        verificationId: verificationId,
                      )));
        },
        codeAutoRetrievalTimeout: (e) {
          stopPhoneRegisterLoader();
        });
  }

  //! verify otp
  bool verifyOtpLoaderRegister = false;
  stopVerifyOtpLoaderRegister() {
    verifyOtpLoaderRegister = false;
    notifyListeners();
  }

  void verifyOtpRegister(
      BuildContext context, String verificationId, String otpController) async {
    verifyOtpLoaderRegister = true;
    notifyListeners();
    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController);
    final auth = Provider.of<AuthProviders>(context, listen: false);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      if (context.mounted) {
        await phoneRegisterPostApi(phoneController.text.trim(), auth, context);
      }
    } on FirebaseAuthException catch (e) {
      toasterMessage(Colors.red, e.message.toString());
      stopVerifyOtpLoaderRegister();
    }
    phoneController.clear();
  }

//! for phone login
  //! phone authentication
  bool phoneLoginLoader = false;
  stopPhoneLoginLoader() {
    phoneLoginLoader = false;
    notifyListeners();
  }

  startPhoneLoginLoader() {
    phoneLoginLoader = true;
    notifyListeners();
  }

  void phoneLoginAuthentication(BuildContext context) async {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${phoneController.text.trim()}',
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          toasterMessage(Colors.red, e.message.toString());
          stopPhoneLoginLoader();
        },
        codeSent: (String verificationId, int? token) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpVerifyPage(
                        verificationId: verificationId,
                      )));
          stopPhoneLoginLoader();
        },
        codeAutoRetrievalTimeout: (e) {
          stopPhoneLoginLoader();
        });
  }

  //! for otp loggin
  bool verifyOtpLoaderLogin = false;
  stopVerifyOtpLoaderLogin() {
    verifyOtpLoaderRegister = false;
    notifyListeners();
  }

  startVerifyOtpLoaderLogin() {
    verifyOtpLoaderRegister = true;
    notifyListeners();
  }

  void verifyOtpLogin(
      BuildContext context, String verificationId, String otpController) async {
    phoneController.clear();
    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (context.mounted) {
        changeScreen(context, const ProfileCompletionCheck());
      }
    } on FirebaseAuthException catch (e) {
      toasterMessage(Colors.red, e.message.toString());
      stopVerifyOtpLoaderLogin();
    }
  }
}
