import 'package:flutter/material.dart';
//import 'widgets/state_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_jugadores/domain/controllers/authentications.dart';
import 'package:red_jugadores/domain/controllers/firestore.dart';
import 'package:red_jugadores/ui/pages/content/users_offers/widgets/add_publicacion.dart';
import 'package:red_jugadores/ui/pages/content/users_offers/widgets/edit_publicacion.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UsersOffersScreen extends StatefulWidget {
  // UsersOffersScreen empty constructor
  const UsersOffersScreen({Key? key}) : super(key: key);

  @override
  _ListapublicacionState createState() => _ListapublicacionState();
}

class _ListapublicacionState extends State<UsersOffersScreen> {
  ControllerFirestore controlp2 = Get.find();
  Controllerauth controluser = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getInfo(context, controlp2.readItems2(), controluser.uid),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AgregarPublicacion());
        },
        tooltip: 'Refrescar',
        child: const FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      // ignore: avoid_print
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaPublicacion(Publicacion: snapshot.data!.docs, uid: uid)
              : const Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return const Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaPublicacion extends StatelessWidget {
  final List Publicacion;
  final String uid;
  const VistaPublicacion({required this.Publicacion, required this.uid});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Publicacion.isEmpty ? 0 : Publicacion.length,
        itemBuilder: (context, posicion) {
          // ignore: avoid_print
          print(Publicacion[posicion].id);
          return Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 16.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(Publicacion[posicion]['photo']),
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Expanded(
                        child: Text(
                          Publicacion[posicion]['titulo'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      (uid == Publicacion[posicion]['uid'])
                          ? IconButton(
                              onPressed: () {
                                Get.to(() => ModificarPublicacion(
                                      Publicacion: Publicacion,
                                      pos: posicion,
                                      iddoc: Publicacion[posicion].id,
                                    ));
                              },
                              icon: const Icon(Icons.edit))
                          : const Text(''),
                      const SizedBox(
                        width: 5.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(Publicacion[posicion]['detalle']),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    child: (Publicacion[posicion]['fotopublicacion'] != '')
                        ? Image.network(
                            Publicacion[posicion]['fotopublicacion'])
                        : const Text(''),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(Publicacion[posicion]['name']),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
