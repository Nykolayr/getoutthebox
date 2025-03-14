import 'package:getoutofthebox/core/di/di.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talker/talker.dart';

class GoogleAuthService {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Метод для входа
  Future<String> signInAndGetIdToken() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        // Получаем ID токен вместо access токена
        final idToken = googleSignInAuthentication.idToken;
        if (idToken != null) {
          getIt.get<Talker>().info("Signed in with Google. ID Token received.");
          return idToken;
        } else {
          getIt.get<Talker>().error("No ID Token received from Google.");
          return '';
        }
      } else {
        return '';
      }
    } catch (error) {
      getIt.get<Talker>().info("Error signing in with Google: $error");
      return '';
    }
  }

  // Метод для выхода
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
