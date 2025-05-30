import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_welcome/src/layouts/colors_app.dart';
import 'package:login_welcome/src/layouts/modal_register_bottom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _docNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedDocType;
  static const List<String> _docTypes = ['DNI', 'C.C.', 'Pasaporte', 'Otro'];

  @override
  void dispose() {
    _docNumberController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _reasonController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final initial =
        _selectedDate ?? DateTime(now.year - 18, now.month, now.day);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final data = {
      'docType': _selectedDocType,
      'docNumber': _docNumberController.text.trim(),
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'dob': _selectedDate != null ? Timestamp.fromDate(_selectedDate!) : null,
      'reason': _reasonController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
      'status': "Pendiente",
    };
    await FirebaseFirestore.instance.collection('registrations').add(data);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Registro enviado con éxito')));
    Navigator.pop(context);
    RegistrationSentModal.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundComponent,
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundComponent,
        iconTheme: const IconThemeData(color: ColorsApp.white),
        title: const Text(
          'Formulario de Registro',
          style: TextStyle(color: ColorsApp.white),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Select tipo de documento
              DropdownButtonFormField<String>(
                value: _selectedDocType,
                decoration: InputDecoration(
                  labelText: 'Tipo de documento',
                  labelStyle: const TextStyle(color: ColorsApp.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                ),
                dropdownColor: ColorsApp.backgroundComponent,
                style: const TextStyle(color: ColorsApp.white),
                items:
                    _docTypes
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(
                              type,
                              style: const TextStyle(color: ColorsApp.white),
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (val) => setState(() => _selectedDocType = val),
                validator:
                    (v) => v == null ? 'Selecciona un tipo de documento' : null,
              ),
              const SizedBox(height: 16),
              // Número de documento
              TextFormField(
                controller: _docNumberController,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                  labelText: 'Número de documento',
                  labelStyle: const TextStyle(color: ColorsApp.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                ),
                keyboardType: TextInputType.text,
                validator:
                    (v) =>
                        v == null || v.isEmpty
                            ? 'Ingresa tu número de documento'
                            : null,
              ),
              const SizedBox(height: 16),
              // Nombre
              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: const TextStyle(color: ColorsApp.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                ),
                validator:
                    (v) => v == null || v.isEmpty ? 'Ingresa tu nombre' : null,
              ),
              const SizedBox(height: 16),
              // Correo electrónico
              TextFormField(
                controller: _emailController,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: const TextStyle(color: ColorsApp.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Ingresa tu correo';
                  final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
                  if (!regex.hasMatch(v)) return 'Correo inválido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Fecha de nacimiento
              TextFormField(
                controller: _dobController,
                readOnly: true,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                  labelText: 'Fecha de Nacimiento',
                  labelStyle: const TextStyle(color: ColorsApp.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                ),
                onTap: _pickDate,
                validator:
                    (v) =>
                        v == null || v.isEmpty
                            ? 'Selecciona tu fecha de nacimiento'
                            : null,
              ),
              const SizedBox(height: 16),
              // Razón
              TextFormField(
                controller: _reasonController,
                style: const TextStyle(color: ColorsApp.white),
                decoration: InputDecoration(
                  labelText: '¿Por qué quieres iniciar con nosotros?',
                  labelStyle: const TextStyle(color: ColorsApp.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsApp.accent),
                  ),
                ),
                maxLines: 3,
                validator:
                    (v) => v == null || v.isEmpty ? 'Escribe una razón' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsApp.accent,
                  ),
                  onPressed: _submit,
                  child: const Text(
                    'Enviar',
                    style: TextStyle(color: ColorsApp.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
