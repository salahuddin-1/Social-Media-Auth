import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInAPI {
  static Future<LoginStatus> signIn() async {
    final data = await FacebookAuth.instance.login(
      permissions: [
        "public_profile",
        "email",
      ],
    );

    return data.status;
  }

  static Future<void> signOut() async {
    return await FacebookAuth.instance.logOut();
  }
}
