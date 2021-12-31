import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_authentication/google_sign_in/resources/api.dart';

class GoogleSignInScreen extends StatefulWidget {
  const GoogleSignInScreen({Key? key}) : super(key: key);

  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final GoogleSignInAPI _googleSignInAPI = GoogleSignInAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign In"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _googleSignInAPI.googleSignInProcess(context);
              },
              child: const Text("Sign in "),
            ),
            ElevatedButton(
              onPressed: () async {
                await _googleSignInAPI.signOut().then(
                  (value) {
                    Fluttertoast.showToast(
                      msg: 'Signed - out ',
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    );
                  },
                );
              },
              child: const Text("Sign out "),
            ),
          ],
        ),
      ),
    );
  }
}
