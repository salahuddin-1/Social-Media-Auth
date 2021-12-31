import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_sign_in_model.dart';

class GoogleSignInAPI {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void googleSignInProcess(BuildContext context) async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    String? token = googleAuth?.idToken;

    GoogleSignInModel _socialGoogleUser = GoogleSignInModel(
      displayName: googleUser?.displayName,
      email: googleUser?.email,
      photoUrl: googleUser?.photoUrl,
      id: googleUser?.id,
      token: token,
    );

    Fluttertoast.showToast(
      msg: googleUser!.email,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );

    print("${_socialGoogleUser.toJson()}");
  }

  Future<void> signOut() async {
    final _isSignedIn = await isSignedIn();

    if (_isSignedIn) {
      await _googleSignIn.signOut();
      return;
    }

    throw Exception('You are not signed in');
  }

  Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }
}
