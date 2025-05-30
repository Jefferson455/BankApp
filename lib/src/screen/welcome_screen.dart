import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';
import 'package:login_welcome/src/screen/register_screen.dart';
import 'login_screen.dart'; // Asegúrate de ajustar la ruta según tu estructura de proyecto

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
      // Se omite el appBar para una pantalla de entrada más limpia
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
                  width: 270,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(ColorsApp.accent),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: ColorsApp.backgroundComponent,
                        fontSize: 20,
                        fontFamily: 'CinzelRegular',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: 180,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(ColorsApp.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      '¡Quiero ser cliente!',
                      style: TextStyle(
                        color: ColorsApp.backgroundComponentSelected,
                        fontSize: 12,
                      ),
                    ),
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
