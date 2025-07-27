// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignAndLoginPlatformCard extends StatelessWidget {
  const SignAndLoginPlatformCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Card
        Card(
          color: Color(0xff6884b9).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              // Google ile giriş işlemi
            },
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(15),
              child: Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        SizedBox(width: 20), // Boşluk ekle
        // Apple Card
        Card(
          color: Color(0xff6884b9).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              // Apple ile giriş işlemi
            },
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(15),
              child: Icon(Icons.apple, color: Colors.white, size: 30),
            ),
          ),
        ),
        SizedBox(width: 20), // Boşluk ekle
        // Facebook Card
        Card(
          color: Color(0xff6884b9).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: () {
              // Facebook ile giriş işlemi
            },
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(15),
              child: Icon(Icons.facebook, color: Colors.white, size: 30),
            ),
          ),
        ),
      ],
    );
  }
}
