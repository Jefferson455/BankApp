// lib/src/screen/admin_screen.dart
import 'package:flutter/material.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';
import 'package:login_welcome/src/core/services/registration_service.dart';
import 'package:login_welcome/src/core/models/registration_model.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late Future<List<Registration>> _requestsFuture;

  @override
  void initState() {
    super.initState();
    _requestsFuture = RegistrationService().getRegistrations();
  }

  Future<void> _refresh() async {
    setState(() {
      _requestsFuture = RegistrationService().getRegistrations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        backgroundColor: ColorsApp.purpleLight,
        title: const Text(
          'Solicitudes de registro',
          style: TextStyle(color: ColorsApp.black),
        ),
        iconTheme: const IconThemeData(color: ColorsApp.black),
      ),
      body: FutureBuilder<List<Registration>>(
        future: _requestsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: \${snapshot.error}'));
          }
          final requests = snapshot.data ?? [];
          if (requests.isEmpty) {
            return const Center(
              child: Text(
                'No hay solicitudes',
                style: TextStyle(color: ColorsApp.white),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: requests.length,
              separatorBuilder:
                  (_, __) => const Divider(color: ColorsApp.white),
              itemBuilder: (context, i) {
                final req = requests[i];
                return ListTile(
                  title: Text(
                    req.name,
                    style: const TextStyle(color: ColorsApp.white),
                  ),
                  subtitle: Text(
                    'Doc: \${req.documentType} \${req.documentNumber}\nMotivo: \${req.reason}',
                    style: const TextStyle(color: ColorsApp.white),
                  ),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.check_circle,
                          color: ColorsApp.accent,
                        ),
                        tooltip: 'Aprobar',
                        onPressed: () async {
                          await RegistrationService().approve(req.id);
                          _refresh();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: ColorsApp.accent,
                        ),
                        tooltip: 'Eliminar',
                        onPressed: () async {
                          await RegistrationService().delete(req.id);
                          _refresh();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Modificaciones en lib/src/screen/login_screen.dart
// ... en el método _login(), después de validar credenciales:

// if (username == 'admin123@gmail.com' && password == '12345') {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (_) => const AdminScreen()),
//   );
// } else {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (_) => const HomeScreen()),
//   );
// }
