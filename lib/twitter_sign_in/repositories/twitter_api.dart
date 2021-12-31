import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_authentication/twitter_sign_in/repositories/social_keys.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterAPI {
//Twitter SignIn Process
  static Future<void> twitterSignInProcess(BuildContext context) async {
    TwitterLogin twitterLogin = TwitterLogin(
      apiKey: SocialKeys.twitterApiKey,
      apiSecretKey: SocialKeys.twitterApiSecretKey,
      redirectURI: SocialKeys.twitterRedirectUri,
    );

    AuthResult authResult = await twitterLogin.login();

    // ProgressDialogUtils.showProgressDialog(context);
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        print("======== LOGIN SUCCESSFULL ==============");

        Fluttertoast.showToast(
            msg: authResult.user!.email.toString(),
            backgroundColor: Colors.blue,
            textColor: Colors.white);
        break;

      case TwitterLoginStatus.cancelledByUser:
        print('======== LOGIN CANCELLED ==============');
        break;

      case TwitterLoginStatus.error:
        print('======== LOGIN ERROR ==============');
        break;

      case null:
        print('======== AUTH RESULT NULL ==============');
        break;
    }
  }
}

class ProgressDialogUtils {
  static showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const SimpleDialog(
        title: Center(
          child: Text('Loading'),
        ),
      ),
    );
  }
}
