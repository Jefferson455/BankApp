// lib/src/core/models/movement.dart
import 'package:cloud_firestore/cloud_firestore.dart';

enum MovementType { deposit, withdraw }

class Movement {
  final int amount;
  final DateTime date;
  final MovementType type;

  Movement({required this.amount, required this.date, required this.type});

  factory Movement.fromMap(Map<String, dynamic> map) {
    return Movement(
      amount: map['amount'] as int,
      date: (map['timestamp'] as Timestamp).toDate(), // importa cloud_firestore
      type:
          map['type'] == 'deposit'
              ? MovementType.deposit
              : MovementType.withdraw,
    );
  }
}
