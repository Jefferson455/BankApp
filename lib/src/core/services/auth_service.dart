// lib/src/core/services/user_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_welcome/src/core/models/movement_model.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getUserData() async {
    print(FirebaseAuth.instance.currentUser?.uid);
    final user = _auth.currentUser;
    if (user == null) return null;

    final doc = await _firestore.collection('users').doc(user.uid).get();
    return doc.data();
  }

  Future<void> withdraw(int amount, String bank) async {
    final u = _auth.currentUser!;
    final ref = _firestore.collection('users').doc(u.uid);
    await ref.update({'monto': FieldValue.increment(-amount)});
    await ref
        .collection('transactions') // o 'movements'
        .add({
          'type': 'withdraw',
          'bank': bank,
          'amount': amount,
          'timestamp': FieldValue.serverTimestamp(),
        });
  }

  Future<void> deposit(int amount, String bank) async {
    final u = FirebaseAuth.instance.currentUser;
    if (u == null) throw Exception('Usuario no autenticado');

    final ref = FirebaseFirestore.instance.collection('users').doc(u.uid);
    await ref.update({'monto': FieldValue.increment(amount)});
    // Registra la transacción con el banco
    await ref.collection('transactions').add({
      'type': 'deposit',
      'bank': bank,
      'amount': amount,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Movement>> getMovements() async {
    final user = _auth.currentUser;
    if (user == null) return [];

    final snapshot =
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('transactions') // ← igual que en deposit()
            .orderBy('timestamp', descending: true)
            .get();

    return snapshot.docs.map((doc) => Movement.fromMap(doc.data())).toList();
  }
}
