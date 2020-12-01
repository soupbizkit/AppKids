import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

import 'package:app_kids/src/providers/rutas_provider.dart';

class MayasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("assets/imagenFondo.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                    backgroundColor: Colors.green[200],
                    title: BorderedText( 
                strokeWidth: 3.0,
                strokeColor: Colors.black,
                child: Text(
                  'Mayas',
                  style: TextStyle(
                  color: Colors.white))),  
            ), //AppBar
            body: Center(
            child: _botones()
            )
        )
      ]
    );
  }
  Widget _botones(){
  return FutureBuilder(
      future: rutasMayasProvider.cargarDatos(),
      builder: (BuildContext contex, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
            padding: EdgeInsets.all(20.0),
            children: _crearBotones(snapshot.data, contex),
            )
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
              shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
              color: Colors.deepOrange[200],
              textColor: Colors.white,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.green[200],
              onPressed: (){
                Navigator.pushNamed(context, element['ruta']);  
              }, 
              child: BorderedText(
                strokeWidth: 5.0,
                strokeColor: Colors.black,
                child: Text(element['title'],
                style: TextStyle(
                  fontSize: 40.0,
                  decoration: TextDecoration.none)
                )
              )
      );

      botones..add(widgetTemp)..add(SizedBox(height: 20));
    });

    return botones;
    
  }
}
