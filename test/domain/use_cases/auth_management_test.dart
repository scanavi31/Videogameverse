import 'package:flutter_test/flutter_test.dart';
import 'package:red_jugadores/domain/use_cases/auth_management.dart';

void main() {
  // AuthManagement uses Auth for management
  // Contrast method result with expected value
  test(
    "SignIn valid",
    () async {
      expect(
          await AuthManagement.signIn(email: "admin", password: "admin"), true);
    },
  );

  test(
    "SignIn invalid",
    () async {
      expect(
          await AuthManagement.signIn(
              email: "example@gamil.com", password: "123456"),
          false);
    },
  );

  test(
    "SignUp valid",
    () async {
      expect(
          await AuthManagement.signUp(
              name: "Ivan",
              email: "darioidcs@hotmail.com",
              password: "Admin_Ivan10*"),
          true);
    },
  );

  test(
    "SignUp invalid",
    () async {
      expect(
          await AuthManagement.signUp(
            name: "Pedro",
            email: "example@hotmail.com",
            password: "1456",
          ),
          false);
    },
  );

  test(
    "SignOut validation",
    () async {
      expect(await AuthManagement.signOut(), true);
    },
  );
}
