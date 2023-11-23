import 'package:flutter/material.dart';
import 'package:zespeedo/common/buttons.dart';
import 'package:zespeedo/common/dimension.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/no-wifi.png',
                  height: screenHeight(context) * 0.5,
                  width: screenWidth(context) * 0.9,
                ),
                const Text('Network connection failure',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const HeightGap(gap: 0.02),
                const Text('Please check your internet connection',
                    style: TextStyle(color: Colors.grey)),
                const HeightGap(gap: 0.02),
                MyButton(
                    buttonColor: Colors.deepPurpleAccent,
                    height: 50,
                    width: screenWidth(context) * 0.5,
                    onTap: () {},
                    child: const Text(
                      'Try Again',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
