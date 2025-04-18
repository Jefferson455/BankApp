import 'package:flutter/material.dart';
// import 'package:login_welcome/src/screen/loginScreen.dart';
import 'package:login_welcome/src/screen/welcome_screen.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Welcome', // se puede cambiar a light()
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false, //! Remueve la tira de debug de la app
    );
  }
}
