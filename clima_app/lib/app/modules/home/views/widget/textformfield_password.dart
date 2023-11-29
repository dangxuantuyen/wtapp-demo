import 'package:flutter/material.dart';

class TextFormFieldWidgetPassword extends StatelessWidget {
  TextFormFieldWidgetPassword(
      {super.key,
      required this.controller,
      required this.hintTextFormField,
      required this.suffixIcon,
      this.obscureText});
  final TextEditingController controller;
  final String hintTextFormField;
  final Widget? suffixIcon;
  bool? obscureText;
  // bool? showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintTextFormField,
          suffixIcon: suffixIcon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
