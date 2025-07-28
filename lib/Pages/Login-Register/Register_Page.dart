// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:otobix/Constants/AppString_constants.dart';
import 'package:otobix/components/View/Button/Button_view.dart';
import 'package:otobix/components/View/TextField/TextField_views.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isRememberMe = false; // Checkbox için state değişkeni

  final maskFormatter = MaskTextInputFormatter(
    mask: '+90 (###) ### ####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Kayıt Ol',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Text(
                  AppStrings.appName,
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                AppStrings.welcomeMessage,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 30),
              // E-posta label ve TextField
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.fullName,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextfieldViews(
                obscureText: false,
                enabled: true,
                hintText: 'Adınız ve soyadınız',
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'E-posta Adresi',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextfieldViews(
                obscureText: false,
                enabled: true,
                hintText: 'ornek@gmail.com',
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Telefon Numarası',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextfieldViews(
                inputFormatters: [maskFormatter],
                obscureText: false,
                enabled: true,
                hintText: '+90 (555) 123 45 67',
              ),
              SizedBox(height: 20),

              // Şifre label ve TextField
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Şifre',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextfieldViews(
                obscureText: true,
                enabled: true,
                hintText: 'Şifrenizi girin',
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    focusColor: Colors.blue.shade300,
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: isRememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        isRememberMe = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    flex: 1,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gizlilik Politikası',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Gizlilik politikası sayfasına yönlendirme
                                  },
                          ),
                          TextSpan(
                            text: AppStrings.and,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: AppStrings.termsOfService,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Kullanım şartları sayfasına yönlendirme
                                  },
                          ),
                          TextSpan(
                            text: AppStrings.agreeText,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ButtonView(
                text: 'Kayıt Ol',
                backgroundColor: Color(0xff2096f3),
                onPressed: () {
                  // Kayıt olma işlemi
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
