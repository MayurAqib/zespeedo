import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zespeedo/common/colors.dart';
import 'package:zespeedo/common/naviagtion.dart';
import 'package:zespeedo/launch/app_launcher.dart';
import 'package:zespeedo/provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProviders>(context, listen: false).gettingId();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    Timer(const Duration(seconds: 3), () {
      replaceScreen(context, const AppLaunch());
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: Container(
            height: 180,
            width: 180,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: themeColor,
              shape: BoxShape.circle,
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.deepPurple.shade200,
              child: Text(
                'Zaspeedo',
                style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w900, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
