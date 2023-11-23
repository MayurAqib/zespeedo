import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zespeedo/pages/authentication/profile_check/profile_completion_check.dart';
import 'package:zespeedo/pages/authentication/welcome/welcome_page.dart';
import 'package:zespeedo/pages/boarding/boarding_page.dart';
import 'package:zespeedo/provider/auth_provider.dart';

class AppLaunch extends StatelessWidget {
  const AppLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProviders>(context, listen: false);
    return FutureBuilder(
      future: auth.isFirstTime(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          bool isFirstTime = snapshot.data!;
          if (isFirstTime) {
            auth.setAppOpened();
            return const BoardingScreen();
          } else {
            if (auth.alreadyLogin) {
              return const ProfileCompletionCheck();
            } else {
              return const WelcomePage();
            }
          }
        }
      },
    );
  }
}
