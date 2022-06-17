import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class FacebookSignIn {
  Map? userData;

  void facebookLogin() async {
    final fb = FacebookLogin();

    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    userData = res.toMap();
  }
}
