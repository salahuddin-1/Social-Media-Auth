import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_authentication/facebook_sign_in/resources/facebook_sign_in_api.dart';

class FacebookScreen extends StatefulWidget {
  const FacebookScreen({Key? key}) : super(key: key);

  @override
  _FacebookScreenState createState() => _FacebookScreenState();
}

class _FacebookScreenState extends State<FacebookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook Sign In"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _signIn,
              child: const Text("Sign in "),
            ),
            ElevatedButton(
              onPressed: _signOut,
              child: const Text("Sign out "),
            ),
          ],
        ),
      ),
    );
  }

  _signIn() async {
    final status = await FacebookSignInAPI.signIn();

    if (status == LoginStatus.success) {
      Fluttertoast.showToast(
        msg: "Success",
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );

      return;
    }
    Fluttertoast.showToast(
      msg: "Failed",
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  _signOut() async {
    await FacebookSignInAPI.signOut();

    Fluttertoast.showToast(
      msg: "Logged out",
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }
}
