import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_jugadores/domain/use_cases/controllers/authentication.dart';
import 'package:red_jugadores/domain/use_cases/controllers/ui.dart';
import 'package:red_jugadores/ui/pages/authentication/auth_page.dart';
import 'package:red_jugadores/ui/pages/content/content_page.dart';
import 'package:red_jugadores/ui/pages/intro/intro_page.dart';
import 'package:red_jugadores/ui/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _stateManagementInit();
    return GetMaterialApp(
      title: 'Red Jugadores - Videogameverse',
      // Quitamos el banner DEBUG
      debugShowCheckedModeBanner: false,
      // Establecemos el tema claro
      theme: MyTheme.ligthTheme,
      // Establecemos el tema oscuro
      darkTheme: MyTheme.darkTheme,
      // Por defecto tomara la seleccion del sistema
      themeMode: ThemeMode.system,
      home: const IntroPage(),
      // We add the two possible routes
      routes: {
        '/intro': (context) => const IntroPage(),
        '/auth': (context) => const AuthenticationPage(),
        '/content': (context) => const ContentPage(),
      },
    );
  }

  void _stateManagementInit() {
    // Dependency Injection
    Get.put(UIController());
    AuthController authController = Get.put(AuthController());
    // Watching auth state changes
    // State management: listening for changes on using the reactive var
    ever(authController.reactiveAuth, (bool authenticated) {
      // Using Get.off so we can't go back when auth changes
      // This navigation triggers automatically when auth state changes on the app state
      if (authenticated) {
        Get.offNamed('/content');
      } else {
        Get.offNamed('/auth');
      }
    });
  }
}
