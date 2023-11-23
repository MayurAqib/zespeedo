import 'package:flutter/material.dart';

class MyTextformField extends StatelessWidget {
  const MyTextformField({
    super.key,
    required this.controller,
    this.validator,
    required this.hintText,
    this.keyBoard,
    this.obscureText = false,
    this.showPass,
    this.enabled,
    this.maxLength,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyBoard;
  final bool? obscureText;
  final Widget? showPass;
  final bool? enabled;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLength: maxLength,
      cursorColor: Colors.grey.shade700,
      keyboardType: keyBoard,
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          filled: true,
          counterText: "",
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff8391A1)),
          suffixIcon: showPass,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffE8ECF4))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffE8ECF4))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1, color: Color(0xff94A1B2)))),
    );
  }
}

class SearchTextformField extends StatelessWidget {
  const SearchTextformField({
    super.key,
    required this.controller,
    this.validator,
    required this.hintText,
    this.showPass,
    this.maxLength,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? showPass;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      cursorColor: Colors.grey.shade700,
      controller: controller,
      validator: validator,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          filled: true,
          counterText: "",
          contentPadding: const EdgeInsets.only(left: 20),
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff8391A1)),
          suffixIcon: showPass,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1, color: Colors.black))),
    );
  }
}
