import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerFirestore extends GetxController {
  static final fs.FirebaseStorage storage = fs.FirebaseStorage.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> readItems() {
    CollectionReference listado = _db.collection('estados');

    return listado.snapshots();
  }

  Stream<QuerySnapshot> readItems2() {
    CollectionReference listado = _db.collection('publicaciones');

    return listado.snapshots();
  }

  Stream<QuerySnapshot> readLocations() {
    CollectionReference listado = _db.collection('ubicacion');

    return listado.snapshots();
  }

  Stream<QuerySnapshot> readpublicidad() {
    CollectionReference listado = _db.collection('publicidad');

    return listado.snapshots();
  }

  Future<void> crearestado(Map<String, dynamic> estados, foto) async {
    var url = '';
    if (foto != null) url = await cargarfoto(foto, DateTime.now().toString());
    print(url);
    estados['fotoestado'] = url.toString();

    await _db.collection('estados').doc().set(estados).catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> crearpublicacion(Map<String, dynamic> publicacion, foto) async {
    var url = '';
    if (foto != null) url = await cargarfoto(foto, DateTime.now().toString());
    print(url);
    publicacion['fotopublicacion'] = url.toString();

    await _db
        .collection('publicaciones')
        .doc()
        .set(publicacion)
        .catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> guardarubicacion(Map<String, dynamic> ubicacion, uid) async {
    await _db.collection('ubicacion').doc(uid).set(ubicacion).catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> actualizarestado(String id, Map<String, dynamic> estados) async {
    await _db.collection('estados').doc(id).update(estados).catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> actualizarpublicacion(
      String id, Map<String, dynamic> publicacion) async {
    await _db
        .collection('publicaciones')
        .doc(id)
        .update(publicacion)
        .catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> eliminarestados(String id) async {
    await _db.collection('estados').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<void> eliminarpublicacion(String id) async {
    await _db.collection('publicaciones').doc(id).delete().catchError((e) {
      print(e);
    });
    //return true;
  }

  Future<dynamic> cargarfoto(var foto, var idfoto) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Estados");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idfoto).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();
    print('url:' + url.toString());
    return url.toString();
  }

  Future<dynamic> cargarfoto2(var foto, var idfoto) async {
    final fs.Reference storageReference =
        fs.FirebaseStorage.instance.ref().child("Publicaciones");

    fs.TaskSnapshot taskSnapshot =
        await storageReference.child(idfoto).putFile(foto);

    var url = await taskSnapshot.ref.getDownloadURL();
    print('url:' + url.toString());
    return url.toString();
  }
}
