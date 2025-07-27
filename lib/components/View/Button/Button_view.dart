// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonView extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  const ButtonView({
    super.key,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          onPressed?.call();
        },
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
