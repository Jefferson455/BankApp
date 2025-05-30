import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';

/// Modal bottom sheet para confirmar envío de registro
typedef VoidCallback = void Function();

class RegistrationSentModal {
  /// Muestra el modal
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorsApp.backgroundComponent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext sheetContext) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tirador
              Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),

              // Mensaje principal
              const Text(
                '¡Registro enviado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsApp.white,
                ),
              ),
              const SizedBox(height: 12),

              // Detalle
              const Text(
                'Hemos enviado el registro. Nos pondremos en contacto contigo lo más pronto posible para terminar tu registro.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: ColorsApp.white),
              ),
              const SizedBox(height: 24),

              // Botón Aceptar
              // Botón Aceptar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(sheetContext).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Aceptar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsApp.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
