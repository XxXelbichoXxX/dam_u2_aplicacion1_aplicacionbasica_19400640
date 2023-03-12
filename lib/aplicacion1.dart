import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class aplicacion1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _aplicacion1();
  }
}

class _aplicacion1 extends State<aplicacion1>{

  final edad = TextEditingController();
  bool _seleccionado = false;
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (_seleccionado){
      _onPressed = (){
        int age = int.parse(edad.text);
        if (age>=18) {
          showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("Ya puedes tramitar tu credencial para votar"),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          ));
        }else {
          showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("No puedes tramitar tu credencial para votar, hasta que seas mayor de edad"),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          ));
        }
      };
    }

    return Scaffold(
    backgroundColor: Colors.purple,
    appBar: AppBar(title: const Center( child: Text("Aplicación 1")),backgroundColor: Colors.blueGrey,
      actions: <Widget>[
        IconButton(onPressed: (){
          showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("Esta aplicación no pertenece al INE, unicamente sirve como ayuda para saber si ya puedes solicitar tu credencial para votar"),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              )
            ],
          ));
        }, icon: Icon(Icons.info))
      ],),
  body: SingleChildScrollView(
    child: Column(
      children: [

        Text("Tramita tu credencial para votar",
            style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        Image.network('https://sitios.ine.mx/archivos2/tutoriales/sistemas/ApoyoInstitucional/PPL/img/ine4.png',
          width: 150,
          height: 80,
        ),
        SizedBox(height: 50),
        Padding(padding: EdgeInsets.all(15),
          child: TextField(
            controller: edad,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: "Ingresa tu edad para corroborar tu tramite: ",
                prefixIcon: Icon(Icons.numbers, color: Colors.white,),
              labelStyle: TextStyle(
                color: Colors.white, // Cambia el color del texto de la etiqueta
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white), // Cambia el color del borde del campo de texto
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // Cambia el color del borde cuando el campo de texto está seleccionado
              ),
            ),
          ),),
        OutlinedButton(onPressed: _onPressed, style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          fixedSize: const Size(300,50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
            child: Text("Comprobar")),
        CheckboxListTile(
            title: Text("Acepto los terminos y condiciones de uso", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            value: _seleccionado,
            onChanged: (bool? valor){
              setState(() {
                _seleccionado = valor!;
              });
            })
      ], //children
    ),
  ),
  );
  }

}