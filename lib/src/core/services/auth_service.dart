// lib/src/core/services/user_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> deposit(int amount) async {
    final u = _auth.currentUser;
    if (u == null) throw Exception('No user');
    await _firestore.collection('users').doc(u.uid).update({
      'monto': FieldValue.increment(amount),
    });
  }
}
