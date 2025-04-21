import 'package:flutter/material.dart';
import 'package:login_welcome/src/core/controllers/login_controller.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';
import 'package:login_welcome/src/screen/home_screen.dart';
import 'package:login_welcome/src/layouts/error_banner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  // instanciamos nuestro controller
  final _loginController = LoginController();

  void _onLoginPressed() async {
    final username = _userController.text.trim();
    final password = _passController.text;

    // delegamos la lógica al controller
    final error = await _loginController.login(username, password);
    if (error == null) {
      // credenciales ok
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      // mostramos banner de error
      showErrorBanner(context, message: error);
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
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 60),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontFamily: "BebasNeueRegular",
                  fontSize: 65,
                  color: ColorsApp.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              cursorColor: ColorsApp.white,
              controller: _userController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: ColorsApp.white),
            ),
            const SizedBox(height: 16),
            TextField(
              cursorColor: ColorsApp.white,
              style: TextStyle(color: ColorsApp.white),
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ElevatedButton(
                onPressed: _onLoginPressed,
                child: const Text('Ingresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
