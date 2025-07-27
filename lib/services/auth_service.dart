import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _emailKey = 'user_email';
  static const String _passwordKey = 'user_password';
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _rememberMeKey = 'remember_me';

  // Giriş yapma
  static Future<bool> login(String email, String password, bool rememberMe) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Basit doğrulama (gerçek uygulamada API çağrısı yapılır)
      if (email.isNotEmpty && password.isNotEmpty) {
        await prefs.setBool(_isLoggedInKey, true);
        
        if (rememberMe) {
          await prefs.setString(_emailKey, email);
          await prefs.setString(_passwordKey, password);
          await prefs.setBool(_rememberMeKey, true);
        } else {
          await prefs.remove(_emailKey);
          await prefs.remove(_passwordKey);
          await prefs.setBool(_rememberMeKey, false);
        }
        return true;
      }
      return false;
    } catch (e) {
      print('Giriş hatası: $e');
      return false;
    }
  }

  // Çıkış yapma
  static Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, false);
      
      // Eğer "Beni hatırla" seçili değilse bilgileri sil
      final rememberMe = prefs.getBool(_rememberMeKey) ?? false;
      if (!rememberMe) {
        await prefs.remove(_emailKey);
        await prefs.remove(_passwordKey);
      }
    } catch (e) {
      print('Çıkış hatası: $e');
    }
  }

  // Giriş durumunu kontrol etme
  static Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_isLoggedInKey) ?? false;
    } catch (e) {
      return false;
    }
  }

  // Kayıtlı e-posta al
  static Future<String> getSavedEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_emailKey) ?? '';
    } catch (e) {
      return '';
    }
  }

  // Kayıtlı şifre al
  static Future<String> getSavedPassword() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_passwordKey) ?? '';
    } catch (e) {
      return '';
    }
  }

  // "Beni hatırla" durumunu kontrol et
  static Future<bool> isRememberMeEnabled() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_rememberMeKey) ?? false;
    } catch (e) {
      return false;
    }
  }
} 