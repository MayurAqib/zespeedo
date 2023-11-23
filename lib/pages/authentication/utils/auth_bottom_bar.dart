import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zespeedo/common/colors.dart';

class AuthBottomBar extends StatelessWidget {
  const AuthBottomBar(
      {super.key,
      required this.message,
      required this.action,
      required this.ontap});
  final String message;
  final String action;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$message ',
              style: GoogleFonts.roboto(fontWeight: FontWeight.w500)),
          GestureDetector(
            onTap: ontap,
            child: Text(action,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: themeColor)),
          )
        ],
      ),
    );
  }
}
