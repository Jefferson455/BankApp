import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

/// Widget que agrupa todos los cards de la pantalla principal
class CardsHome extends StatelessWidget {
  const CardsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _RetirarCard(),
        SizedBox(height: 16),
        _DepositarCard(),
        SizedBox(height: 16),
        _HistorialCard(),
        // ¡Agrega más cards aquí si los necesitas!
      ],
    );
  }
}

class _RetirarCard extends StatelessWidget {
  const _RetirarCard();

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 14, color: ColorsApp.white),
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
    );
  }
}

class _DepositarCard extends StatelessWidget {
  const _DepositarCard();

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 14, color: ColorsApp.white),
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
    );
  }
}

class _HistorialCard extends StatelessWidget {
  const _HistorialCard();

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 14, color: ColorsApp.white),
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
                  // Acción de revisar historial
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
    );
  }
}
