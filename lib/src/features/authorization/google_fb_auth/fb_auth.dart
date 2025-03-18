import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<String> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      Logger.i('result: $result');
      Logger.i('result: ${result.accessToken}');
      if (result.status == LoginStatus.success) {
        // Возвращаем строковое значение токена вместо объекта AccessToken
        return result.accessToken?.tokenString ?? '';
      } else {
        return '';
      }
    } catch (e) {
      Logger.e('Ошибка при авторизации через Facebook: $e');
      return '';
    }
  }

  Future<void> signOut() async {
    try {
      await FacebookAuth.instance.logOut();
    } catch (e) {
      Logger.e('Ошибка при выходе из Facebook: $e');
    }
  }
}
