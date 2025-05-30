// lib/src/screen/history_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_welcome/src/core/models/movement_model.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

class HistoryScreen extends StatelessWidget {
  final List<Movement> movements;
  const HistoryScreen({Key? key, required this.movements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd/MM/yyyy – HH:mm');
    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        backgroundColor: ColorsApp.purpleLight,
        iconTheme: const IconThemeData(color: ColorsApp.black),
        title: const Text(
          'Historial de tu dinero',
          style: TextStyle(color: ColorsApp.black),
        ),
      ),
      body:
          movements.isEmpty
              ? const Center(
                child: Text(
                  'No hay movimientos aún',
                  style: TextStyle(color: ColorsApp.white),
                ),
              )
              : ListView.separated(
                itemCount: movements.length,
                separatorBuilder:
                    (_, __) => const Divider(color: ColorsApp.white),
                itemBuilder: (_, i) {
                  final m = movements[i];
                  return ListTile(
                    leading: Icon(
                      m.type == MovementType.withdraw
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: ColorsApp.accent,
                    ),
                    title: Text(
                      '\$${m.amount}',
                      style: const TextStyle(color: ColorsApp.white),
                    ),
                    subtitle: Text(
                      df.format(m.date),
                      style: const TextStyle(color: ColorsApp.white),
                    ),
                  );
                },
              ),
    );
  }
}
