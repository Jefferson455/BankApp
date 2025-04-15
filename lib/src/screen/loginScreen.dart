import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colorsApp.dart';
import 'package:login_welcome/src/screen/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String _message = '';

  void _login() {
    final username = _userController.text.trim();
    final password = _passController.text;

    if (username == 'jeffer' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() {
        _message = '❌ Usuario o contraseña incorrecta.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Iniciar sesión',
              style: const TextStyle(
                fontFamily: "BebasNeueRegular",
                fontSize: 80,
                color: ColorsApp.wText,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              cursorColor: ColorsApp.accent,
              controller: _userController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _login, child: const Text('Ingresar')),
            const SizedBox(height: 16),
            Text(
              _message,
              style: const TextStyle(fontSize: 16, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
