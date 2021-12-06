import 'package:red_jugadores/domain/repositories/auth.dart';

class Auth implements AuthInterface {
  @override
  Future<bool> signIn({required String email, required String password}) async {
    final emailVal = "admin" == email;
    final passwordVal = "admin" == password;
    return emailVal && passwordVal;
  }

  @override
  Future<bool> signOut() async {
    return true;
  }

  @override
  Future<bool> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final emailVal = email.contains("@") && email.contains(".co");
    final passwordVal = password.length > 6;
    return emailVal && passwordVal;
  }
}
