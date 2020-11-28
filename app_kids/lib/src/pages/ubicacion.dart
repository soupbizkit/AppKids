import 'package:flutter/material.dart';

import 'package:app_kids/src/providers/culturas_provider.dart';

class Ubicacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicacion')
      ),
      body: _lista(),
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: culturaProvider.cargarDatos(),
      builder: (BuildContext contex, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return Image.network(snapshot.data[0]['incas']['img-ubicacion']);
        }else{
          print('waiting');
          return CircularProgressIndicator();
        }   
      },
    );
  }

  ListTile _info(List<dynamic> data){
    return ListTile(
      leading: Icon( Icons.accessible_forward_sharp, color: Colors.red),
      title: Text(data[0]['incas']['ubicacion'])
    );
  }
}