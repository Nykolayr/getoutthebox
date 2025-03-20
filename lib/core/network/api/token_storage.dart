import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  String acsessToken;
  String refreshToken;

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
    this.acsessToken = acsessToken;
    this.refreshToken = refreshToken;
  }

  Future<String> getAcsessToken() async {
    final prefs = await SharedPreferences.getInstance();
    acsessToken = prefs.getString('acsessToken') ?? '';
    return acsessToken;
  }

  Future<String> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    refreshToken = prefs.getString('refreshToken') ?? '';
    return refreshToken;
  }

  Future<void> deleteTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('acsessToken');
    await prefs.remove('refreshToken');
    acsessToken = '';
    refreshToken = '';
  }
}
