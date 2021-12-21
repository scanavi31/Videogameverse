//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:get/route_manager.dart';
//import 'package:red_jugadores/domain/use_cases/controllers/authentication.dart';
//import 'package:red_jugadores/domain/use_cases/controllers/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:red_jugadores/domain/controllers/authentications.dart';
import 'package:red_jugadores/domain/controllers/connectivity.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onViewSwitch;

  const LoginScreen({Key? key, required this.onViewSwitch}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController emailuser = TextEditingController();
  TextEditingController passwuser = TextEditingController();

  Controllerauth controluser = Get.find();
  late ConnectivityController connectivityController;

  @override
  void initState() {
    super.initState();
    connectivityController = Get.find<ConnectivityController>();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? passw = prefs.getString('pass');

    if (email != null) {
      setState(() {
        emailuser.text = email;
        passwuser.text = passw!;
        if (controluser.emailf != 'Sin Registro')
          _inicio(emailuser.text, passwuser.text);
      });
      return;
    }
  }

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.registrarEmail(theEmail, thePassword);
      //  Get.to(() => ListaMensajes());
      // Get.to(() => ListaMensajeros2(title: 'Titulo'));
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _inicio(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await controluser.ingresarEmail(theEmail, thePassword);
      //  Get.to(() => ListaMensajes());
      //Get.to(() => ListaMensajeros2(title: 'Titulo'));
      if (controluser.emailf != 'Sin Registro') {
        Get.offNamed('/content');
      } else {
        Get.snackbar(
          "Login",
          'Ingrese un Email Valido',
          icon: Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _google() async {
    try {
      await controluser.ingresarGoogle();
      //Get.to(() => ListaMensajeros2(title: 'Titulo'));
      // Get.to(() => ListaMensajes());
      Get.offNamed('/content');
    } catch (err) {
      print(err.toString());
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 130.0,
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailuser,
                decoration: InputDecoration(hintText: 'Ingrese el Email'),
              ),
              TextField(
                controller: passwuser,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        if (connectivityController.connected) {
                          _inicio(emailuser.text, passwuser.text);
                        } else {
                          GetSnackBar(
                            title: 'No esta conectado a un Red',
                            duration: Duration(seconds: 5),
                          );
                        }
                      },
                      icon: Icon(Icons.login)),
                  IconButton(
                      onPressed: () {
                        if (connectivityController.connected) {
                          _login(emailuser.text, passwuser.text);
                        } else {
                          GetSnackBar(
                            title: 'No esta conectado a un Red',
                            duration: Duration(seconds: 5),
                          );
                        }
                      },
                      icon: Icon(Icons.app_registration))
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (connectivityController.connected) {
            _google();
          } else {
            GetSnackBar(
              title: 'No esta conectado a un Red',
              duration: Duration(seconds: 5),
            );
          }
        },
        child: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.white,
        ),
      ),
    );
  }
}


/*
class _State extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final controller = Get.put(AuthController());
  final connectivityController = Get.find<ConnectivityController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 130.0,
            backgroundImage: AssetImage('assets/logo.jpg'),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Iniciar sesión",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const Key("signInEmail"),
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo electrónico',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: const Key("signInPassword"),
              controller: passwordController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Clave',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                    child: const Text("Login"),
                    onPressed: () async {
                      if (connectivityController.connected) {
                        await controller.manager.signIn(
                            email: emailController.text,
                            password: passwordController.text);
                      } else {
                        Get.showSnackbar(
                          GetBar(
                            message: "No estas conectado a la red.",
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
          TextButton(
            key: const Key("toSignUpButton"),
            child: const Text("Registrarse"),
            onPressed: widget.onViewSwitch,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
*/
