import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';

class FacebookAuthService {
  Future<String> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      Logger.i('result: $result');
      Logger.i('result: ${result.accessToken}');
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData(
          fields: "email,name",
        );
        Logger.i('userData: $userData');

        // Получаем email из данных пользователя
        final email = userData['email'] ?? '';
        Logger.i('email: $email ${result.accessToken?.tokenString}');
        final ResponseApi res = await Api()
            .loginViaFacebook(email, fcmToken: result.accessToken?.tokenString);
        if (res is ResSuccess) {
          Logger.i('Success ${res.data}');
          final accessToken = res.data['access'];
          return accessToken;
        } else if (res is ResError) {
          Logger.e('Error signing in with Facebook: ${res.errorMessage}');
        }
      } else {
        return '';
      }
    } catch (e) {
      Logger.e('Ошибка при авторизации через Facebook: $e');
      return '';
    }
    return '';
  }

  Future<void> signOut() async {
    try {
      await FacebookAuth.instance.logOut();
    } catch (e) {
      Logger.e('Ошибка при выходе из Facebook: $e');
    }
  }
}
