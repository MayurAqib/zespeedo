import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zespeedo/common/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.onTap,
      this.borderColor = Colors.transparent,
      this.buttonColor = themeColor,
      this.height = 56,
      required this.child,
      this.width});
  final Function()? onTap;
  final Color? borderColor;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            side: MaterialStatePropertyAll(BorderSide(color: borderColor!)),
            backgroundColor: MaterialStatePropertyAll(buttonColor!),
          ),
          child: child),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton(
      {super.key,
      required this.onTap,
      required this.alignment,
      required this.icon,
      this.color});
  final void Function() onTap;
  final double alignment;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: themeColor.withOpacity(0.6),
      onTap: onTap,
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment(alignment, 0),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200)),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}

class ButtonTextStyles {
  static TextStyle buttonTextStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );
}
