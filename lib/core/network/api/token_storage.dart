import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  final String acsessToken;
  final String refreshToken;

  TokenStorage(this.acsessToken, this.refreshToken);

  static Future<TokenStorage> fromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('acsessToken') ?? '';
    final refreshToken = prefs.getString('refreshToken') ?? '';
    return TokenStorage(accessToken, refreshToken);
  }

  Future<void> saveTokens(String acsessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('acsessToken', acsessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  Future<String> getAcsessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('acsessToken') ?? '';
  }

  Future<String> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refreshToken') ?? '';
  }

  Future<void> deleteTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('acsessToken');
    await prefs.remove('refreshToken');
  }
}
