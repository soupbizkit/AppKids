import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

import 'package:app_kids/src/providers/culturas_provider.dart';

class UbicacionMayas extends StatelessWidget {

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
            Text('Territorio Maya', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            SizedBox(height: 20),
            ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image:NetworkImage(data.elementAt(2)['mayas']['img-ubicacion']) ,
                    placeholder: AssetImage('assets/loading.gif'),
                    height: 500.0,
                    fit: BoxFit.cover
                    ) 
            ), 
            SizedBox(height: 20),
            Text(data.elementAt(2)['mayas']['ubicacion'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
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
                    image:NetworkImage(data.elementAt(2)['mayas']['img-gobernante']) ,
                    placeholder: AssetImage('assets/loading.gif'),
                    height: 500.0,
                    fit: BoxFit.cover
                    )
            ), 
            SizedBox(height: 20),
            Text(data.elementAt(2)['mayas']['gobernante'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
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
            Text('Construcciones', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            SizedBox(height: 20),
            ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image:NetworkImage(data.elementAt(2)['mayas']['img-construcciones']),
                    placeholder: AssetImage('assets/loading.gif'),
                    height: 500.0,
                    fit: BoxFit.cover
                    )
            ), 
            SizedBox(height: 20),
            Text(data.elementAt(2)['mayas']['construcciones'], style: TextStyle(color: Colors.black, fontSize: 20.0)) 
          ]
        )
      ) 
    );
}