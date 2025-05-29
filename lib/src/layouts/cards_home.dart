import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

class CardsHome extends StatelessWidget {
  // 1) Declara los callbacks
  final VoidCallback? onWithdraw;
  final VoidCallback? onDeposit;
  final VoidCallback? onHistory;

  const CardsHome({Key? key, this.onWithdraw, this.onDeposit, this.onHistory})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat.decimalPattern('es');
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        // --- Card de Retirar dinero ---
        Card(
          color: ColorsApp.backgroundComponent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: ColorsApp.accent.withOpacity(0.5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.price_check, size: 40, color: ColorsApp.accent),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                // 2) Llama al callback aquí
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.accent,
                    ),
                    onPressed: onWithdraw,
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

        // --- Card de Depositar dinero ---
        Card(
          color: ColorsApp.backgroundComponent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: ColorsApp.accent.withOpacity(0.5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.price_change_outlined,
                      size: 40,
                      color: ColorsApp.accent,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                    onPressed: onDeposit,
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

        // --- Card de Historial ---
        Card(
          color: ColorsApp.backgroundComponent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: ColorsApp.accent.withOpacity(0.5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.work_history_outlined,
                      size: 40,
                      color: ColorsApp.accent,
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            'Revisa tus depósitos y retiros',
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
                    onPressed: onHistory,
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
      ],
    );
  }
}
