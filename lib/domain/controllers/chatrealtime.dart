import 'package:firebase_database/firebase_database.dart';
import 'package:red_jugadores/domain/models/chat.dart';

import 'package:get/get.dart';

class Controlchat extends GetxController {
  final DatabaseReference _mensajesRef =
      FirebaseDatabase.instance.ref().child('mensajes');

  void guardarMensaje(Mensaje mensaje) {
    _mensajesRef.push().set(mensaje.toJson());
  }

  void actualizarMensaje(Map<String, dynamic> datosmod, String idmensaje) {
    _mensajesRef.child(idmensaje).update(datosmod);
  }

  void deleteMensaje(String idmensaje) {
    _mensajesRef.child(idmensaje).remove();
  }

  Query getMensajes() => _mensajesRef;
}
