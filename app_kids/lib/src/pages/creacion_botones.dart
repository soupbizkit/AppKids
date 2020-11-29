import 'package:flutter/material.dart';

import 'package:app_kids/src/providers/opciones_provider.dart';

Widget botones(){
  return FutureBuilder(
      future: opcionesProvider.cargarDatos(),
      builder: (BuildContext contex, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return ListView(
            children: _crearBotones(snapshot.data, contex),
          );
        }else{
          print('waiting');
          return CircularProgressIndicator();
        }   
      },
    );
}

  List<Widget> _crearBotones(List<dynamic> data, BuildContext context){
    final List<Widget> botones = [];

    data.forEach((element){
      final widgetTemp = RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                Navigator.pushNamed(context, element['ruta']);  
              }, 
              child: Text(
                element['title'],
                style: TextStyle(fontSize: 40.0))
      );

      botones..add(widgetTemp)..add(SizedBox(height: 20));
    });

    return botones;
    
}