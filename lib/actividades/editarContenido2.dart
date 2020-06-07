import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterregistro/actividades/mostrarcontenido.dart';
import 'package:flutterregistro/preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:flutterregistro/models/Lugar.dart';
import 'package:flutterregistro/providers/api_lugares.dart';

final prefs = new PreferenciasUsuario();

class Editaritem2 extends StatefulWidget {

  Editaritem2({Key key, this.lugar});
  Lugar lugar;

  @override
  _Editaritem2State createState() => _Editaritem2State();
}

class _Editaritem2State extends State<Editaritem2> {

  TextEditingController descripcionUpdate = TextEditingController();
  TextEditingController latitudUpdate = TextEditingController();
  TextEditingController longitudUpdate = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descripcionUpdate.text = widget.lugar.descripcion;
    latitudUpdate.text = (widget.lugar.latitud).toString();
    longitudUpdate.text = (widget.lugar.longitud).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Registro de lugar"),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return MostrarContenido();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
      body: Form(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 100,
                ),

                _descripcion(),
                _latitud(),
                _longitud(),

                RaisedButton(
                  child: Text("Editar registro"),
                  onPressed: (){
                    if(descripcionUpdate.text != "" && latitudUpdate.text != "" && longitudUpdate.text != ""){


                      Lugar lugar = Lugar(

                        persona_id: widget.lugar.persona_id,
                        descripcion: descripcionUpdate.text,
                        latitud: double.parse(latitudUpdate.text),
                        longitud: double.parse(longitudUpdate.text),
                        id: widget.lugar.id,


                      );
                      print(json.encode(lugar));
                      editarLugar(lugar).then((value){
                        print(value.body);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MostrarContenido()));
                        Toast.show("Lugar actualizado correctamente", context, duration: Toast.LENGTH_SHORT);
                      }).catchError((onError){
                        print(onError);
                      });
                    }else{
                      Toast.show("Debes de llenar todos los campos", context, duration: Toast.LENGTH_SHORT);
                    }
                  },
                )

              ],
            ),
          ),)),
    );
  }

  Widget _descripcion() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child:TextFormField(

        keyboardType: TextInputType.text,
        controller: descripcionUpdate,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(70, 70, 70, 1),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                  color: Color.fromRGBO(96, 100, 98, 1)
              )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(190, 190, 190, 1)),
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          hintText: "Nombre del lugar",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black38,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _latitud() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child:TextFormField(

        keyboardType: TextInputType.text,
        controller: latitudUpdate,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(70, 70, 70, 1),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                  color: Color.fromRGBO(96, 100, 98, 1)
              )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(190, 190, 190, 1)),
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          hintText: "Latitud (00.00000)",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black38,
            fontSize: 16,
          ),
        ),
      ),
    );
  }


  Widget _longitud() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child:TextFormField(

        keyboardType: TextInputType.text,
        controller: longitudUpdate,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(70, 70, 70, 1),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(
                  color: Color.fromRGBO(96, 100, 98, 1)
              )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(220, 220, 220, 1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color.fromRGBO(190, 190, 190, 1)),
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          hintText: "Longitud (00.0000",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black38,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
