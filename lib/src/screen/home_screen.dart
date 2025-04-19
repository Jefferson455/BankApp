import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_welcome/src/layouts/cards_home.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';
import 'package:login_welcome/src/layouts/modal_bottom_logout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat nf = NumberFormat.decimalPattern('es');
    final int saldo = 1234567890;
    final String saldoFormateado = nf.format(saldo);

    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: ColorsApp.purpleLight,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Stack(
            children: [
              // Texto de bienvenida en la esquina inferior izquierda
              const Positioned(
                left: 16,
                bottom: 0,
                child: Text(
                  'BIENVENIDO,\nJEFFERSON',
                  style: TextStyle(
                    color: ColorsApp.black,
                    fontFamily: 'BebasNeueRegular',
                    fontSize: 55,
                  ),
                ),
              ),

              // Icono de logout en la esquina superior derecha
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(
                    Icons.outbond_outlined,
                    color: ColorsApp.black,
                  ),
                  onPressed: () => LogoutModal.show(context),
                  tooltip: 'Cerrar sesión',
                ),
              ),
            ],
          ),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        color: ColorsApp.backgroundComponent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabecera fija con saldo
            const Text(
              'Tus finanzas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: ColorsApp.white),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Saldo: ',
                  style: TextStyle(fontSize: 20, color: ColorsApp.white),
                ),
                Text(
                  '\$$saldoFormateado',
                  style: const TextStyle(
                    fontSize: 20,
                    color: ColorsApp.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Área desplazable con cards
            Expanded(child: CardsHome()),
          ],
        ),
      ),
    );
  }
}
