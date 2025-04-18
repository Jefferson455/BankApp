import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colorsApp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: ColorsApp.purpleLight,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Stack(
            children: [
              // 1) Texto en la esquina inferior izquierda
              Positioned(
                left: 16,
                bottom: 0,
                child: Text(
                  'BIENVENIDO, \nJEFFERSON',
                  style: const TextStyle(
                    color: ColorsApp.black,
                    fontFamily: "BebasNeueRegular",
                    fontSize: 55,
                  ),
                ),
              ),

              // 2) Icono en la esquina superior derecha
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(
                    Icons.outbound_sharp,
                    color: ColorsApp.black,
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
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
            // Cabecera fija
            const Text(
              'Tus finanzas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: ColorsApp.white),
            ),
            const SizedBox(height: 8),
            Row(
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
                    color: ColorsApp.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Área desplazable con cards
            Expanded(
              child: ListView(
                children: [
                  // Card Retirar dinero
                  Card(
                    color: ColorsApp.backgroundComponent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: ColorsApp.accent.withOpacity(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.price_check,
                                size: 40,
                                color: ColorsApp.accent,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Retirar dinero',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Retira tu dinero de manera segura',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsApp.accent,
                              ),
                              onPressed: () {
                                // Acción de retirar dinero
                              },
                              child: const Text(
                                'Retirar',
                                style: TextStyle(color: ColorsApp.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Card Depositar dinero
                  Card(
                    color: ColorsApp.backgroundComponent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: ColorsApp.accent.withOpacity(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.price_change_outlined,
                                size: 40,
                                color: ColorsApp.accent,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Depositar dinero',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Con nosotros tu dinero está seguro',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsApp.accent,
                              ),
                              onPressed: () {
                                // Acción de depositar dinero
                              },
                              child: const Text(
                                'Depositar',
                                style: TextStyle(color: ColorsApp.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Card historial de dinero
                  Card(
                    color: ColorsApp.backgroundComponent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: ColorsApp.accent.withOpacity(0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24.0,
                        horizontal: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                //* Iconos
                                Icons.work_history_outlined,
                                size: 40,
                                color: ColorsApp.accent,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Historial de tu dinero',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Revisa tus depositos y retiros',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsApp.accent,
                              ),
                              onPressed: () {
                                // Acción de depositar dinero
                              },
                              child: const Text(
                                'Revisar',
                                style: TextStyle(color: ColorsApp.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Puedes seguir agregando más cards aquí...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
