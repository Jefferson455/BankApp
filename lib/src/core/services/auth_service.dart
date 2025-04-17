class AuthService {
  /// Simula llamada a un backend.
  Future<bool> authenticate(String username, String password) async {
    // aquí podrías hacer un HTTP request real
    await Future.delayed(const Duration(milliseconds: 500));
    return username == 'jeffer' && password == '1234';
  }
}
