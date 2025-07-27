// ignore_for_file: file_names, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Bu import'u ekleyin
import 'package:otobix/Constants/AppColor_constants.dart';
import 'package:otobix/Constants/AppString_constants.dart';
import 'package:otobix/Pages/Login-Register/Register_Page.dart';
import 'package:otobix/Pages/Login-Register/Login_Page.dart';
import 'package:otobix/components/View/Button/Button_view.dart';
import 'package:otobix/components/View/Card/SignAndLoginPaltform/SignAndLoginPlatform_card.dart';
import 'package:page_transition/page_transition.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Mavi opacity katmanı
          Container(color: Colors.blue.withOpacity(0.4)),
          // İçerik
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10), // Yukarıdan boşluk ekleyin
                Text(
                  'Otobix',
                  style: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Text(
                    AppStrings.appDescription,
                    textAlign: TextAlign.center, // Metni ortala
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ButtonView(
                  text: 'Giriş Yap',
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: LoginPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                ButtonView(
                  text: 'Kayıt Ol',
                  // ignore: deprecated_member_use
                  backgroundColor: Color(0xff6884b9).withOpacity(0.5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: RegisterPage(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'veya',
                  style: TextStyle(
                    color: Color(0xffbbc3d8),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 30),
                SignAndLoginPlatformCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
