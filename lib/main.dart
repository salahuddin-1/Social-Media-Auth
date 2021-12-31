import 'package:flutter/material.dart';
import 'package:social_media_authentication/twitter_sign_in/screens/twitter_screen.dart';

import 'facebook_sign_in/screens/facebook_screen_1.dart';
import 'google_sign_in/screens/google_sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TwitterScreen(),
    );
  }
}
