import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Volver al login
              Navigator.pop(context);
            },
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: const Center(
        child: Text('Bienvenido, Jeffer 🚀', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
