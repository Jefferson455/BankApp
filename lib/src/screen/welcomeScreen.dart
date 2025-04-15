import 'package:flutter/material.dart';
import 'loginScreen.dart'; // Asegúrate de ajustar la ruta según tu estructura de proyecto

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Puedes omitir el appBar para una pantalla de entrada más limpia
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botón para "Registrarme"
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica de registro o navegar a otra pantalla de registro.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Funcionalidad de registro no implementada aún.',
                      ),
                    ),
                  );
                },
                child: const Text('Registrarme'),
              ),
              const SizedBox(height: 20),
              // Botón para "Iniciar sesión"
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
