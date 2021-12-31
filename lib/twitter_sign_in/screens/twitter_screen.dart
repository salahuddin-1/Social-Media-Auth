import 'package:flutter/material.dart';
import 'package:social_media_authentication/twitter_sign_in/repositories/twitter_api.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  _TwitterScreenState createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twitter Sign In"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                TwitterAPI.twitterSignInProcess(context);
              },
              child: const Text("Sign in "),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Sign out "),
            ),
          ],
        ),
      ),
    );
  }
}
