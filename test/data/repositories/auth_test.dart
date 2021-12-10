import 'package:flutter_test/flutter_test.dart';
import 'package:red_jugadores/data/repositories/auth.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

  test('auth-signin', () async {
    final result = await auth.signIn(email: "admin", password: "admin");
    expect(result, true);
  });

  test('auth-signup', () async {
    final result = await auth.signUp(
        name: "Ivan",
        email: "darioidcs@hotmail.com",
        password: "Admin_Ivan10*");
    expect(result, true);
  });

  test('auth-signout', () async {
    final result = await auth.signOut();
    expect(result, true);
  });
}
