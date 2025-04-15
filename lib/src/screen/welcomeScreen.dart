import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colorsApp.dart';
import 'loginScreen.dart'; // Asegúrate de ajustar la ruta según tu estructura de proyecto

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        backgroundColor: ColorsApp.background,
        toolbarHeight: 150,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            "BankApp",
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
              color: ColorsApp.wText,
            ),
          ),
        ),
        centerTitle: false,
      ),
      // Puedes omitir el appBar para una pantalla de entrada más limpia
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 210, right: 50, left: 50),
              child: Text(
                "“El futuro de tus finanzas, en tus manos.”",
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorsApp.fText),
              ),
            ),
            // Botón para "Iniciar sesión"
            Padding(
              padding: const EdgeInsets.only(top: 290),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
