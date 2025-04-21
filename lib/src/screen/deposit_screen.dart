import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

/// Pantalla para seleccionar el monto a Depositar
class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  // Montos predefinidos (en COP)
  static const List<int> _amountOptions = [10000, 20000, 50000, 100000, 200000];

  int? _selectedAmount;
  final TextEditingController _otherController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.decimalPattern('es');

    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        backgroundColor: ColorsApp.purpleLight,
        elevation: 0,
        title: const Text(
          'Depositar dinero',
          style: TextStyle(color: ColorsApp.black),
        ),
        iconTheme: const IconThemeData(color: ColorsApp.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Opciones fijas
            ..._amountOptions.map((amt) {
              final formatted = '\$${numberFormat.format(amt)} COP';
              return Card(
                color: ColorsApp.backgroundComponent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: ColorsApp.accent.withOpacity(0.5)),
                ),
                child: RadioListTile<int>(
                  activeColor: ColorsApp.accent,
                  value: amt,
                  groupValue: _selectedAmount,
                  onChanged: (val) => setState(() => _selectedAmount = val),
                  title: Text(
                    formatted,
                    style: const TextStyle(color: ColorsApp.white),
                  ),
                ),
              );
            }),

            // Opción "Otro valor"
            Card(
              color: ColorsApp.backgroundComponent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: ColorsApp.accent.withOpacity(0.5)),
              ),
              child: RadioListTile<int>(
                activeColor: ColorsApp.accent,
                value: -1,
                groupValue: _selectedAmount,
                onChanged: (val) => setState(() => _selectedAmount = val),
                title: const Text(
                  'Otro valor',
                  style: TextStyle(color: ColorsApp.white),
                ),
              ),
            ),

            // Si seleccionó "Otro valor", mostrar campo de texto
            if (_selectedAmount == -1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _otherController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: ColorsApp.white),
                  decoration: InputDecoration(
                    labelText: 'Introduce el monto',
                    labelStyle: const TextStyle(color: ColorsApp.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.accent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsApp.accent),
                    ),
                  ),
                ),
              ),

            const Spacer(),

            // Botón de confirmación
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.accent,
                ),
                onPressed: () {
                  int finalAmount;
                  if (_selectedAmount == -1) {
                    finalAmount =
                        int.tryParse(
                          _otherController.text.replaceAll('.', ''),
                        ) ??
                        0;
                  } else {
                    finalAmount = _selectedAmount ?? 0;
                  }
                  // Devolver el monto o manejar el retiro
                  Navigator.pop(context, finalAmount);
                },
                child: const Text(
                  'Continuar',
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
