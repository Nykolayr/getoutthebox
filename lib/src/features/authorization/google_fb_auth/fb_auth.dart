import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<AccessToken?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      return result.accessToken;
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
  }
}
