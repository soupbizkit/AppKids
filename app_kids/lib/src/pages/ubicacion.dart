import 'package:flutter/material.dart';

import 'package:app_kids/src/providers/culturas_provider.dart';

class Ubicacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Ubicacion')
      ),
      body: _ubicacion()  
      );
  }

  Widget _ubicacion(){
    return FutureBuilder(
      future: culturaProvider.cargarDatos(),
      builder: (BuildContext contex, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              _cardTerritorio(snapshot.data, contex),
              _cardGobernante(snapshot.data, contex),
              _cardConstruccion(snapshot.data, contex)
            ] 
          );
        }else{
          print('waiting');
          return CircularProgressIndicator();
        }   
      },
    );
  }
}

Widget _cardTerritorio(List<dynamic> data, BuildContext context){
    return Card(
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: [
            FadeInImage(
              image:NetworkImage(data.elementAt(0)['incas']['img-ubicacion']) ,
              placeholder: AssetImage('assets/loading.gif'),
              height: 500.0,
              fit: BoxFit.fill
            ), 
            SizedBox(height: 20),
            Text('Incas', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            Text(data.elementAt(0)['incas']['ubicacion'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      )    
    );
}

Widget _cardGobernante(List<dynamic> data, BuildContext context){
    return Card(
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: [
            FadeInImage(
              image:NetworkImage(data.elementAt(0)['incas']['img-gobernante']) ,
              placeholder: AssetImage('assets/loading.gif'),
              height: 500.0,
              fit: BoxFit.fill
            ), 
            SizedBox(height: 20),
            Text('Incas', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            Text(data.elementAt(0)['incas']['gobernante'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      )    
    );
}

Widget _cardConstruccion(List<dynamic> data, BuildContext context){
    return Card(
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: [
            FadeInImage(
              image:NetworkImage(data.elementAt(0)['incas']['img-construnciones']),
              placeholder: AssetImage('assets/loading.gif'),
              height: 500.0,
              fit: BoxFit.fill
            ), 
            SizedBox(height: 20),
            Text('Incas', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            Text(data.elementAt(0)['incas']['construcciones'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      )    
    );
}