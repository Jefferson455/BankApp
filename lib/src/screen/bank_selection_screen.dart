// lib/src/screen/bank_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

class BankSelectionScreen extends StatelessWidget {
  /// Monto que se va a depositar (sólo para mostrarlo en el título)
  final int amount;
  const BankSelectionScreen({Key? key, required this.amount}) : super(key: key);

  static const _banks = [
    'Nequi',
    'Bancolombia',
    'Daviplata',
    'Banco de bogotá',
    'BBVA',
    'MOVII',
    'NU',
    'LULO BANK',
    'BANCO DE OCCIDENTE',
    'BANCO POPULAR',
    'BANCO SANTANDER',
    'CITABANK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        backgroundColor: ColorsApp.purpleLight,
        iconTheme: const IconThemeData(color: ColorsApp.black),
        title: Text(
          'Depositar \$${amount.toString()}',
          style: const TextStyle(color: ColorsApp.black),
        ),
      ),
      body: ListView.separated(
        itemCount: _banks.length,
        separatorBuilder: (_, __) => const Divider(color: ColorsApp.white),
        itemBuilder: (ctx, i) {
          final bank = _banks[i];
          return ListTile(
            leading: const Icon(
              Icons.account_balance_wallet,
              color: ColorsApp.accent,
            ),
            title: Text(bank, style: const TextStyle(color: ColorsApp.white)),
            onTap: () {
              // Cuando el usuario elija, devolvemos el nombre del banco
              Navigator.pop(ctx, bank);
            },
          );
        },
      ),
    );
  }
}
