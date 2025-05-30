// lib/src/layouts/cards_home.dart
import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

class CardsHome extends StatelessWidget {
  /// Callbacks que vienen de HomeScreen
  final VoidCallback onWithdraw;
  final VoidCallback onDeposit;
  final VoidCallback onHistory;

  const CardsHome({
    Key? key,
    required this.onWithdraw,
    required this.onDeposit,
    required this.onHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCard(
          icon: Icons.price_check,
          title: 'Retirar dinero',
          subtitle: 'Retira tu dinero de manera segura',
          buttonText: 'Retirar',
          onPressed: onWithdraw,
        ),
        const SizedBox(height: 16),
        _buildCard(
          icon: Icons.price_change_outlined,
          title: 'Depositar dinero',
          subtitle: 'Con nosotros tu dinero está seguro',
          buttonText: 'Depositar',
          onPressed: onDeposit,
        ),
        const SizedBox(height: 16),
        _buildCard(
          icon: Icons.work_history_outlined,
          title: 'Historial de tu dinero',
          subtitle: 'Revisa tus depósitos y retiros',
          buttonText: 'Revisar',
          onPressed: onHistory,
        ),

        // ... más cards si quieres
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Card(
      color: ColorsApp.backgroundComponent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: ColorsApp.accent.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: ColorsApp.accent),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
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
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: const TextStyle(color: ColorsApp.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
