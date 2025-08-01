// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otobix/Constants/AppString_constants.dart';
import 'package:otobix/components/View/Button/Button_view.dart';
import 'package:otobix/components/View/TextField/TextField_views.dart';
import 'package:otobix/services/auth_service.dart';
import 'package:otobix/Pages/Dashboard/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false; // Checkbox için state değişkeni
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final savedEmail = await AuthService.getSavedEmail();
    final savedPassword = await AuthService.getSavedPassword();
    final rememberMe = await AuthService.isRememberMeEnabled();
    
    if (savedEmail.isNotEmpty && savedPassword.isNotEmpty && rememberMe) {
      setState(() {
        _emailController.text = savedEmail;
        _passwordController.text = savedPassword;
        isRememberMe = true;
      });
    }
  }

  Future<void> _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('Lütfen tüm alanları doldurun');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final success = await AuthService.login(
        _emailController.text,
        _passwordController.text,
        isRememberMe,
      );

      if (success) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => DashboardPage()),
          (route) => false,
        );
      } else {
        _showSnackBar('Giriş başarısız. Lütfen bilgilerinizi kontrol edin.');
      }
    } catch (e) {
      _showSnackBar('Bir hata oluştu: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

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
            'Giriş Yap',
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
                  AppStrings.welcomeBack,
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                AppStrings.loginMessage,
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
                  AppStrings.email,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextfieldViews(
                controller: _emailController,
                obscureText: false,
                enabled: true,
                hintText: 'ornek@gmail.com',
              ),
              SizedBox(height: 20),
              // Şifre label ve TextField
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.password,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextfieldViews(
                controller: _passwordController,
                obscureText: true,
                enabled: true,
                hintText: 'Şifrenizi girin',
              ),
              SizedBox(height: 20),
              // Checkbox ve "Beni Hatırla" yazısı
              Row(
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
                  Text(
                    AppStrings.rememberMe,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Şifremi unuttum işlemi
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ButtonView(
                text: _isLoading ? 'Giriş Yapılıyor...' : AppStrings.loginTitle,
                backgroundColor: Color(0xff2096f3),
                onPressed: _isLoading ? null : _handleLogin,
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Hesabınız yok mu? ',
                  style: GoogleFonts.roboto(
                    color: Colors.black54,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Kayıt Olun',
                      style: GoogleFonts.roboto(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              // Kayıt olma işlemi
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
