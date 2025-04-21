import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_welcome/src/layouts/cards_home.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';
import 'package:login_welcome/src/layouts/modal_bottom_logout.dart';
import 'package:login_welcome/src/core/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _nombre = '';
  int _monto = 0;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargarDatosUsuario();
  }

  Future<void> _cargarDatosUsuario() async {
    final datos = await UserService().getUserData();
    if (datos != null) {
      setState(() {
        _nombre = datos['nombre'] ?? 'Usuario';
        _monto = datos['monto'] ?? 0;
        _cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat nf = NumberFormat.decimalPattern('es');
    final String saldoFormateado = nf.format(_monto);

    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: ColorsApp.purpleLight,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Stack(
            children: [
              // Texto de bienvenida en la esquina inferior izquierda
              Positioned(
                left: 16,
                bottom: 0,
                child:
                    _cargando
                        ? const CircularProgressIndicator()
                        : Text(
                          'BIENVENIDO,\n${_nombre.toUpperCase()}',
                          style: const TextStyle(
                            color: ColorsApp.black,
                            fontFamily: 'BebasNeueRegular',
                            fontSize: 55,
                          ),
                        ),
              ),

              // Icono de logout en la esquina superior derecha
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: const Icon(
                    Icons.outbond_outlined,
                    color: ColorsApp.black,
                  ),
                  onPressed: () => LogoutModal.show(context),
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
            const Text(
              'Tus finanzas',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, color: ColorsApp.white),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Saldo: ',
                  style: TextStyle(fontSize: 20, color: ColorsApp.white),
                ),
                Text(
                  _cargando ? 'Cargando...' : '\$$saldoFormateado',
                  style: const TextStyle(
                    fontSize: 20,
                    color: ColorsApp.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(child: CardsHome()),
          ],
        ),
      ),
    );
  }
}
