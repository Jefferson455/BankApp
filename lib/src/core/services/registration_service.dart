// lib/src/core/services/registration_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_welcome/src/core/models/registration_model.dart';

class RegistrationService {
  final _fire = FirebaseFirestore.instance;
  final _col = 'registrations';

  Future<List<Registration>> getRegistrations() async {
    final snap = await _fire.collection(_col).orderBy('status').get();
    return snap.docs.map((d) => Registration.fromDoc(d.id, d.data())).toList();
  }

  Future<void> approve(String id) async {
    await _fire.collection(_col).doc(id).update({'status': 'Pendiente'});
  }

  Future<void> delete(String id) async {
    await _fire.collection(_col).doc(id).delete();
  }
}
