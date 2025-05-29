import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

/// Pantalla para seleccionar el monto a retirar
class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  // Montos predefinidos (en COP)
  static const List<int> _amountOptions = [10000, 20000, 50000, 100000, 200000];

  int? _selectedAmount;
  final TextEditingController _otherController = TextEditingController();
  bool _loading = false;

  /// Servicio para actualizar el campo `monto` en Firestore
  Future<void> _performWithdrawal(int amount) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception('Usuario no autenticado');

    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Usar transacción para asegurar consistencia
    await FirebaseFirestore.instance.runTransaction((tx) async {
      final snapshot = await tx.get(docRef);
      final current = snapshot.get('monto') as int? ?? 0;
      if (current < amount) {
        throw Exception('Saldo insuficiente');
      }
      tx.update(docRef, {'monto': current - amount});
    });
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.decimalPattern('es');

    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        backgroundColor: ColorsApp.purpleLight,
        elevation: 0,
        title: const Text(
          'Retirar dinero',
          style: TextStyle(color: ColorsApp.black),
        ),
        iconTheme: const IconThemeData(color: ColorsApp.black),
      ),
      body: Stack(
        children: [
          Padding(
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
                      side: BorderSide(
                        color: ColorsApp.accent.withOpacity(0.5),
                      ),
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
                    onPressed:
                        _loading
                            ? null
                            : () async {
                              setState(() => _loading = true);
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
                              try {
                                await _performWithdrawal(finalAmount);
                                Navigator.pop(context, finalAmount);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      e.toString().replaceFirst(
                                        'Exception: ',
                                        '',
                                      ),
                                    ),
                                  ),
                                );
                              } finally {
                                setState(() => _loading = false);
                              }
                            },
                    child: Text(
                      _loading ? 'Procesando...' : 'Continuar',
                      style: const TextStyle(color: ColorsApp.black),
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (_loading)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black38,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }
}
