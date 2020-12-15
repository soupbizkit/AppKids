import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:app_kids/src/providers/culturas_provider.dart';

class SocialAztecas extends StatefulWidget {
  @override
  SocialAztecasState createState() => SocialAztecasState();
}

class SocialAztecasState extends State<SocialAztecas>{
  String _actualContainer = '';
  
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
                    'Organizacion social',
                    style: TextStyle(
                    color: Colors.white))),
          ),
          body: _estructuraSocial()  
        )
      ]
    );
  }

  Widget _estructuraSocial(){
    return FutureBuilder(
      future: culturaProvider.cargarDatos(),
      builder: (BuildContext contex, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              _organizacionSocial(snapshot.data, contex),
              _piramideSocial(snapshot.data, contex)
            ] 
          );
        }else{
          print('waiting');
          return CircularProgressIndicator();
        }   
      },
    );
  }

  Widget _organizacionSocial(List<dynamic> data, BuildContext context){
    return Card(
      child: Column(children: [
        Text('Organizacion Social de los incas',maxLines: 1,style: TextStyle(fontSize: 18)),
        Text(data.elementAt(1)['aztecas']['social']),
        FadeInImage(
          image:NetworkImage(data.elementAt(1)['aztecas']['img-social']),
          placeholder: AssetImage('asset/loading.gif'),
          height: 350,
          fit: BoxFit.cover)
      ])
    );
  }

  Widget _piramideSocial(List<dynamic> data, BuildContext context){
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: _containerClases(data, context),
        ),
        )
      );
  }
  List<Widget> _containerClases(List<dynamic> data, BuildContext context){
    final List<Widget> opciones = [];
    final List<dynamic> clases = data.elementAt(1)['aztecas']['lista-clases'];
    clases.forEach((element) {
      final containerTemporal = Container(
        child: Row(
          children: [
            FadeInImage(
            image:NetworkImage(element['imagen']),
            placeholder: AssetImage('asset/loading.gif'),
            height: 150,
            width: 120,
            fit: BoxFit.cover),
            Expanded(
              child: Column(
                children: [
                  Text(element['nombre'],textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(element['descripcion'],textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))
                ],
              ),
            )
          ],
        ),
      );
      opciones.add(Divider(color: Colors.white,));
      opciones.add(containerTemporal);
    });
    return opciones;
  }

}