import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colorsApp.dart';
import 'loginScreen.dart'; // Asegúrate de ajustar la ruta según tu estructura de proyecto

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.background,
      /* appBar: AppBar(
        backgroundColor: ColorsApp.background,
        toolbarHeight: 150,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            "BankApp",
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
              color: ColorsApp.white,
            ),
          ),
        ),
        centerTitle: false,
      ), */
      // Puedes omitir el appBar para una pantalla de entrada más limpia
      body: Container(
        decoration: BoxDecoration(
          color: ColorsApp.backgroundComponent,
          image: DecorationImage(
            image: AssetImage('assets/images/bankBack.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1) Aquí va BankApp
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 10),
                child: Text(
                  'BankApp',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.purpleLight,
                  ),
                ),
              ),

              // 2) Spacer para empujar tu quote y botón abajo
              const Spacer(),

              // 3) Tu quote
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '“El futuro de tus finanzas, en tus manos.”',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: ColorsApp.white),
                ),
              ),

              const SizedBox(height: 40),

              // 4) Botón
              Center(
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => const LoginScreen()),
                      );
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
