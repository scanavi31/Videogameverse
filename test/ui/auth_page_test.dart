import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:red_jugadores/ui/pages/authentication/auth_page.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  testWidgets("login-screen", (WidgetTester tester) async {
    binding.window.physicalSizeTestValue = const Size(1080, 1920);
    binding.window.devicePixelRatioTestValue = 1.0;
    // Widgets Testing requires that the widgets we need to test have a unique key
    final emailField = find.byKey(const ValueKey("signInEmail"));
    final passwordField = find.byKey(const ValueKey("signInPassword"));

    // We begin the rendering of the main widgets
    await tester.pumpWidget(const GetMaterialApp(home: AuthenticationPage()));
    await tester.enterText(emailField, "admin");
    await tester.enterText(passwordField, "admin");
    // After entering needed text and tap on the button we wait
    // that all animations end
    await tester.pumpAndSettle();

    expect(find.text("admin"), findsOneWidget);
    expect(find.text("admin"), findsOneWidget);
  });

  testWidgets("signup-screen", (WidgetTester tester) async {
    // Widgets Testing requires that the widgets we need to test have a unique key
    final nameField = find.byKey(const ValueKey("signUpName"));
    final emailField = find.byKey(const ValueKey("signUpEmail"));
    final passwordField = find.byKey(const ValueKey("signUpPassword"));
    final switchTo = find.byKey(const ValueKey("toSignUpButton"));

    // We begin the rendering of the main widgets
    await tester.pumpWidget(const GetMaterialApp(home: AuthenticationPage()));
    await tester.pump();
    await tester.tap(switchTo);
    await tester.pumpAndSettle();
    await tester.enterText(nameField, "Ivan");
    await tester.enterText(emailField, "darioidcs@hotmail.com");
    await tester.enterText(passwordField, "Admin_Ivan10*");
    // After entering needed text and tap on the button we wait
    // that all animations end
    await tester.pumpAndSettle();

    expect(find.text("darioidcs@hotmail.com"), findsOneWidget);
    expect(find.text("Admin_Ivan10*"), findsOneWidget);
  });
}
