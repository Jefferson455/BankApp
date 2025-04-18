import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colorsApp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundComponent,
        automaticallyImplyLeading:
            false, //!Quita la flecha por defecto de los iphone hacía atrás
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'BIENVENIDO JEFFERSON',
              style: const TextStyle(
                color: ColorsApp.white,
                fontFamily: "BebasNeueRegular",
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
              textScaler: TextScaler.linear(1.3),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.login_outlined, color: ColorsApp.white),
            onPressed: () {
              // Volver al login
              //!Devuelve a la primera screen cuando cierra sesión
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: Container(
        height: 1000,
        width: 1000,
        color: ColorsApp.backgroundComponent,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Tus finanzas',
                    style: TextStyle(fontSize: 24, color: ColorsApp.white),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Saldo: ',
                  style: TextStyle(fontSize: 20, color: ColorsApp.white),
                ),
                Text(
                  '\$1000000',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsApp.accent, // por ejemplo color de énfasis
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
