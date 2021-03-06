import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

import 'package:app_kids/src/providers/culturas_provider.dart';

class UbicacionAztecas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("asset/imagenFondo.jpg",
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
                    'Ubicación',
                    style: TextStyle(
                    color: Colors.white))),
          ),
          body: _ubicacion()  
        )
      ]
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
              SizedBox(height: 20),
              _cardGobernante(snapshot.data, contex),
              SizedBox(height: 20),
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
      elevation: 10,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Territorio', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            SizedBox(height: 20),
            ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image:NetworkImage(data.elementAt(1)['aztecas']['img-ubicacion']) ,
                    placeholder: AssetImage('asset/loading.gif'),
                    height: 500.0,
                    fit: BoxFit.cover
                    ) 
            ), 
            SizedBox(height: 20),
            Text(data.elementAt(1)['aztecas']['ubicacion'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      )    
    );
}

Widget _cardGobernante(List<dynamic> data, BuildContext context){
    return Card(
      elevation: 10,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Gobernante', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            SizedBox(height: 20),
            ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image:NetworkImage(data.elementAt(1)['aztecas']['img-gobernante']) ,
                    placeholder: AssetImage('asset/loading.gif'),
                    height: 500.0,
                    fit: BoxFit.cover
                    )
            ), 
            SizedBox(height: 20), 
            Text(data.elementAt(1)['aztecas']['gobernante'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      )    
    );
}

Widget _cardConstruccion(List<dynamic> data, BuildContext context){
    return Card(
      elevation: 10,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Construccion', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            SizedBox(height: 20),
            ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image:NetworkImage(data.elementAt(1)['aztecas']['img-construcciones']),
                    placeholder: AssetImage('asset/loading.gif'),
                    height: 500.0,
                    fit: BoxFit.cover
                    )
            ), 
            SizedBox(height: 20),
            Text(data.elementAt(1)['aztecas']['construcciones'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      ) 
    );
}