// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';

class TextfieldViews extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;

  const TextfieldViews({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    required this.obscureText,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    required this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.focusedBorderColor,
    this.enabledBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        cursorColor: Colors.black,
        cursorErrorColor: Colors.red,
        cursorWidth: 2,
        cursorHeight: 18,

        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        enabled: enabled,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: enabledBorderColor ?? Colors.grey.shade300,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: focusedBorderColor ?? Colors.blue,
              width: 2,
            ),
          ),
          filled: true,
        ),
      ),
    );
  }
}
