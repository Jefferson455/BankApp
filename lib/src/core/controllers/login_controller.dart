import '../services/auth_service.dart';

class LoginController {
  final AuthService _authService;

  LoginController(this._authService);

  /// Devuelve null si todo ok, o un mensaje de error.
  Future<String?> login(String username, String password) async {
    final ok = await _authService.authenticate(username, password);
    if (ok) {
      return null;
    } else {
      return 'Usuario o contraseña incorrecta.';
    }
  }
}
