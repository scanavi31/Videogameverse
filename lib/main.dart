import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_jugadores/domain/controllers/authentications.dart';
import 'package:red_jugadores/domain/controllers/chatrealtime.dart';
import 'package:red_jugadores/domain/controllers/connectivity.dart';
import 'package:red_jugadores/domain/controllers/firestore.dart';
import 'package:red_jugadores/domain/controllers/locations.dart';
import 'package:red_jugadores/domain/controllers/themecontroller.dart';
import 'package:red_jugadores/ui/app.dart';
import 'package:get/get.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Workmanager().initialize(
    updatePositionInBackground,
    isInDebugMode: true,
  );
  await Firebase.initializeApp();
  Get.put(Controlchat());
  Get.put(ControllerFirestore());
  Get.put(Controllerauth());
  Get.put(ThemeController());
  Get.put(Controllerlocations());
  // Connectivity Controller
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  // Connectivity stream
  Connectivity().onConnectivityChanged.listen((connectivityStatus) {
    connectivityController.connectivity = connectivityStatus;
  });

  runApp(const App());
}

void updatePositionInBackground() async {
  Workmanager().executeTask((task, inputData) async {
    Controllerlocations controlubicacion = Get.find();
    controlubicacion.obtenerubicacion();
    return Future.value(true);
  });
}
