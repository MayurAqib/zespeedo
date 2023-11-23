import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zespeedo/common/dimension.dart';

class Heading extends StatelessWidget {
  const Heading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.04),
      child: Text(
        title,
        style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 22),
      ),
    );
  }
}
