import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:getoutofthebox/core/network/api/api.dart';
import 'package:getoutofthebox/core/network/api/response_api.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Метод для входа
  Future<String> signInAndGetIdToken() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final idToken = googleSignInAuthentication.idToken;
        if (idToken != null) {
          final email = googleSignInAccount.email;
          Logger.d("Success GoogleSignInAccount $email $idToken");
          final ResponseApi res =
              await Api().loginViaGoogle(email, fcmToken: idToken);
          if (res is ResSuccess) {
            Logger.i("Success  ${res.data}");
            final accessToken = res.data['access'];
            return accessToken;
          } else if (res is ResError) {
            Logger.e("Error signing in with Google: ${res.errorMessage}");
            return '';
          }
        } else {
          Logger.e("No ID Token received from Google.");
          return '';
        }
      } else {
        Logger.e("No GoogleSignInAccount received from Google.");
        return '';
      }
    } catch (error) {
      Logger.e("Error signing in with Google: $error");
      return '';
    }
    return '';
  }

  // Метод для выхода
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
