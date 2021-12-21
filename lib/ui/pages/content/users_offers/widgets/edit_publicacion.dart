import 'package:flutter/material.dart';
import 'package:red_jugadores/domain/controllers/firestore.dart';

import 'package:get/get.dart';

class ModificarPublicacion extends StatefulWidget {
  final iddoc;
  final pos;
  final List Publicacion;
  ModificarPublicacion({required this.Publicacion, this.pos, this.iddoc});

  @override
  _ModificarPublicacionState createState() => _ModificarPublicacionState();
}

class _ModificarPublicacionState extends State<ModificarPublicacion> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlpublicacion = Get.find();

  @override
  void initState() {
    controltitulo =
        TextEditingController(text: widget.Publicacion[widget.pos]['titulo']);
    controldetalle =
        TextEditingController(text: widget.Publicacion[widget.pos]['detalle']);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Mensajero"),
        actions: [
          IconButton(
              tooltip: 'Eliminar Cliente',
              icon: Icon(Icons.delete),
              onPressed: () {
                controlpublicacion
                    .eliminarpublicacion(widget.Publicacion[widget.pos].id);
                Get.back();
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controltitulo,
                decoration: InputDecoration(labelText: "Titulo"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controldetalle,
                decoration: InputDecoration(labelText: "Detalle"),
              ),
              ElevatedButton(
                child: Text("Modificar Mensajero"),
                onPressed: () {
                  var Publicacion = <String, dynamic>{
                    'titulo': controltitulo.text,
                    'detalle': controldetalle.text,
                  };

                  controlpublicacion.actualizarpublicacion(
                      widget.Publicacion[widget.pos].id, Publicacion);

                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
