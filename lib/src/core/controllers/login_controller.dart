import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  LoginController();

  /// Devuelve null si todo ok, o un mensaje de error.
  Future<String?> login(String username, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: username.trim(),
        password: password.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return 'Usuario o contraseña incorrecta.';
    } catch (e) {
      return 'Usuario o contraseña incorrecta.';
    }
  }
}
