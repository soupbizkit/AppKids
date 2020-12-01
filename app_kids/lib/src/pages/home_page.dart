import 'package:flutter/material.dart';

import 'package:app_kids/src/providers/rutas_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
              backgroundColor: Colors.yellow[700],
              title: Text('América Precolombina', style: TextStyle(color: Colors.black)), 
      ), //AppBar
      body: _botones(),
    );
  }

Widget _botones(){
  return FutureBuilder(
      future: rutasCulturasProvider.cargarDatos(),
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
                element['ruta'],
                style: TextStyle(fontSize: 40.0))
      );

      botones..add(widgetTemp)..add(SizedBox(height: 20));
    });

    return botones;
    
  }
}