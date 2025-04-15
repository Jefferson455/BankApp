import 'package:flutter/material.dart';
// import 'package:login_welcome/src/screen/loginScreen.dart';
import 'package:login_welcome/src/screen/welcomeScreen.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Welcome',
      theme: ThemeData.dark(), // se puede cambiar a light()
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
