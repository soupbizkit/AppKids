import 'package:flutter/material.dart';

import 'package:app_kids/src/providers/culturas_provider.dart';

class SocialMayas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Estructura Social')
      ),
      body: _estructuraSocial()  
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
              _organizacionSocial(snapshot.data, contex)
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
        Title(
          color: Colors.black,
          title: 'Organizazion de los mayas',
          child: Text(data.elementAt(2)['mayas']['social'], style: TextStyle(color: Colors.black, fontSize: 20.0)),),
        FadeInImage(
          image:NetworkImage(data.elementAt(2)['mayas']['img-social']),
          placeholder: AssetImage('assets/loading.gif'),
          height: 350,
          fit: BoxFit.cover)
      ])
    );
  }
}