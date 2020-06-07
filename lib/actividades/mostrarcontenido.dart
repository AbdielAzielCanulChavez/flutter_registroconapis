import 'package:flutter/material.dart';
import 'package:flutterregistro/actividades/editarContenido2.dart';
import 'package:flutterregistro/actividades/editarRegistro.dart';
import 'package:flutterregistro/models/Lugar.dart';
import 'package:flutterregistro/providers/api_lugares.dart';


class MostrarContenido extends StatefulWidget {
  @override
  _MostrarContenidoState createState() => _MostrarContenidoState();
}

class _MostrarContenidoState extends State<MostrarContenido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud lista"),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return EditarContenido();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: getLugar(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString())
                  );
                }else if(snapshot.connectionState == ConnectionState.done){
                  var response = snapshot.data as List<Lugar>;
                  return ListView.builder(
                    itemCount: response.length,
                    itemBuilder: (context, position){
                      var lugaresItem =  response[position];
                      return GestureDetector(
                        onLongPress: (){

                          eliminarLugar(lugaresItem);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MostrarContenido()));
                        },
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return Editaritem2(lugar: lugaresItem,);
                          }));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(lugaresItem.descripcion, style: Theme.of(context).textTheme.subtitle1,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  return Center(
                    child: Text("Sucess")
                  );
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }




}
