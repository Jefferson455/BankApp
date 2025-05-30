// lib/src/core/models/registration_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Registration {
  final String id;
  final String documentType;
  final String documentNumber;
  final String name;
  final DateTime birthDate;
  final String reason;
  final String email;
  final String status;

  Registration({
    required this.id,
    required this.documentType,
    required this.documentNumber,
    required this.name,
    required this.birthDate,
    required this.reason,
    required this.email,
    required this.status,
  });

  factory Registration.fromDoc(String id, Map<String, dynamic> data) {
    return Registration(
      id: id,
      documentType: data['docType'] as String,
      documentNumber: data['docNumber'] as String,
      name: data['name'] as String,
      birthDate: (data['dob'] as Timestamp).toDate(),
      reason: data['reason'] as String,
      email: data['email'] as String,
      status: data['status'] as String,
    );
  }
}
