import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colorsApp.dart';

/// Muestra un MaterialBanner de error en la parte superior del Scaffold.
/// Se oculta automáticamente después de [duration].
void showErrorBanner(
  BuildContext context, {
  required String message,
  Duration duration = const Duration(seconds: 3),
}) {
  final messenger = ScaffoldMessenger.of(context);

  // Primero limpia cualquier banner anterior
  messenger.clearMaterialBanners();

  // Crea el banner
  messenger.showMaterialBanner(
    MaterialBanner(
      elevation: 1,
      margin: EdgeInsets.all(30),
      backgroundColor: ColorsApp.purpleLight,
      content: Text(
        message,
        style: const TextStyle(color: ColorsApp.purple, fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () => messenger.hideCurrentMaterialBanner(),
          child: const Text('X', style: TextStyle(color: ColorsApp.purple)),
        ),
      ],
    ),
  );

  // Lo oculta después de [duration]
  Future.delayed(duration, () {
    messenger.hideCurrentMaterialBanner();
  });
}
