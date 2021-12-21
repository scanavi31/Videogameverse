import 'dart:math';

import 'package:flutter/material.dart';
//import 'widgets/location_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:red_jugadores/domain/controllers/authentications.dart';
import 'package:red_jugadores/domain/controllers/firestore.dart';
import 'package:red_jugadores/domain/controllers/locations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<LocationScreen> {
  ControllerFirestore controlp = Get.find();
  Controllerauth controluser = Get.find();
  Controllerlocations controlubicacion = Get.find();
  ControllerFirestore controlguardarloc = Get.find();

  @override
  void initState() {
    super.initState();
    controlubicacion.obtenerubicacion();
    _initNotificaciones();
    Workmanager().registerPeriodicTask(
      "1",
      "ObtenerUbicacionesPeriodicas",
    );
  }

  _initNotificaciones() async {
    final _plugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _plugin.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[50],
        title: ListTile(
          title: Obx(() => Text(
              'Lat: ${controlubicacion.locationlat} Lon: ${controlubicacion.locationlo}')),
          subtitle: Text(controluser.name),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controlubicacion.obtenerubicacion();
                var ubicacion = <String, dynamic>{
                  'lat': controlubicacion.locationlat,
                  'lo': controlubicacion.locationlo,
                  'name': controluser.name,
                  'uid': controluser.uid,
                };
                controlguardarloc.guardarubicacion(ubicacion, controluser.uid);

                displayNotification(
                    title: 'Cerca de Mi',
                    body: '${controlubicacion.cercanos}  Amigos a mi Ubicaion');
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Obx(
        () => (controlubicacion.locationlat != '')
            ? getInfo(context, controlp.readLocations(), controluser.uid,
                controlubicacion.locationlat, controlubicacion.locationlo)
            : const Center(
                child: Icon(Icons.accessibility_new),
              ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controlubicacion.obtenerubicacion();
        },
        tooltip: 'Refrescar',
        child: const FaIcon(
          FontAwesomeIcons.searchLocation,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  displayNotification({required String title, required String body}) async {
    final _plugin = FlutterLocalNotificationsPlugin();
    // ignore: avoid_print
    print("doing test");
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await _plugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }
}

@override
Widget getInfo(BuildContext context, Stream<QuerySnapshot> ct, String uid,
    String lat, String lo) {
  return StreamBuilder(
    stream: ct,
    /*FirebaseFirestore.instance
        .collection('clientes')
        .snapshots(),*/ //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      print(snapshot.connectionState);
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return const Center(child: CircularProgressIndicator());

        case ConnectionState.active:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaLocations(
                  locations: snapshot.data!.docs, uid: uid, lat: lat, lo: lo)
              : Text('Sin Datos');

        /*
             Text(
              snapshot.data != null ?'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}' : 'Vuelve a intentar', 
              style: TextStyle(color: Colors.black, fontSize: 20),);
            */

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}

class VistaLocations extends StatelessWidget {
  final List locations;
  final String uid;
  final String lat;
  final String lo;
  const VistaLocations(
      {required this.locations,
      required this.uid,
      required this.lat,
      required this.lo});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listacalculo = [];
    Controllerlocations controlubicacion = Get.find();

//*********Calculo de Distancias***********//

    double deg2rad(double deg) {
      return (deg * pi / 180.0);
    }

    double rad2deg(double rad) {
      return (rad * 180.0 / pi);
    }

    String distance(
        double lat1, double lon1, double lat2, double lon2, String unit) {
      double theta = lon1 - lon2;
      double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
          cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
      dist = acos(dist);
      dist = rad2deg(dist);
      dist = dist * 60 * 1.1515;
      if (unit == 'K') {
        dist = dist * 1.609344;
      } else if (unit == 'N') {
        dist = dist * 0.8684;
      }
      return dist.toStringAsFixed(2);
    }

    //**********************************//

    for (int i = 0; i < locations.length; i++) {
      if (uid != locations[i]['uid']) {
        String distancia = distance(
            double.parse(lat),
            double.parse(lo),
            double.parse(locations[i]['lat']),
            double.parse(locations[i]['lo']),
            'K');

        var calc = <String, dynamic>{
          'name': locations[i]['name'],
          'lat': locations[i]['lat'],
          'lo': locations[i]['lo'],
          'Dist': distancia
        };
        // if (double.parse(distancia) < 500) listacalculo.add(calc);
        listacalculo.add(calc);
      }
    }

    listacalculo.sort((a, b) {
      return a['Dist'].compareTo(b['Dist']);
    });

    controlubicacion.cercanos = listacalculo.length.toString();

    return ListView.builder(
        itemCount: listacalculo.length == 0 ? 0 : listacalculo.length,
        itemBuilder: (context, posicion) {
          //print(listacalculo[posicion].id);
          return ListTile(
            leading: IconButton(
              onPressed: () async {
                final url =
                    "https://www.google.es/maps?q=${listacalculo[posicion]['lat']},${listacalculo[posicion]['lo']}";
                await launch(url);
              },
              icon: Icon(Icons.map_sharp),
            ),
            title: Text(
                'Lat:${listacalculo[posicion]['lat']} Lo: ${listacalculo[posicion]['lo']}'),
            subtitle: Text(listacalculo[posicion]['name']),
            trailing: Container(
              width: 45,
              height: 20,
              color: Colors.red,
              child: Text(listacalculo[posicion]['Dist']),
            ),
          );
        });
  }
}
/*
class _State extends State<LocationScreen> {
  final items = List<String>.generate(8, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LocationCard(
          title: 'MI UBICACIÓN',
          lat: 11.004556423794284,
          long: -74.7217010498047,
          onUpdate: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'CERCA DE MÍ',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        // ListView on remaining screen space
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return LocationCard(
                title: 'John Doe',
                lat: 11.004556423794284,
                long: -74.7217010498047,
                distance: 25,
                onUpdate: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
*/