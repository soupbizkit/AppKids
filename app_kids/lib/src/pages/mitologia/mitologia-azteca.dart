import 'package:app_kids/src/providers/culturas_provider.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class MitologiaAzteca extends StatelessWidget {
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
                    'Mitología',
                    style: TextStyle(
                    color: Colors.white))),
          ),
          body: _dioses()
        )
      ]
    );
  }

  Widget _dioses(){
    return FutureBuilder(
      future: culturaProvider.cargarDatos(),
      builder: (BuildContext contex, AsyncSnapshot<List<dynamic>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          return ListView(
            padding: EdgeInsets.all(5.0),
            children: [
              _slimyCardDioses(snapshot.data, contex),
              _slimyCardMito(snapshot.data, contex)
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

Widget _slimyCardDioses(List<dynamic> data, BuildContext context){
  return Container(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: _listDioses(data, context)),
      ),
  );
}

List<Widget> _listDioses(List<dynamic> data, BuildContext context){
  final List<Widget> opciones = [];
  final List<dynamic> dioses = data.elementAt(1)['aztecas']['lista-dioses'];
  dioses.forEach((element) {
    final slimyActual = SlimyCard(
      color: Colors.deepOrange[100],
      topCardWidget: _customTop(element),
      bottomCardHeight: 200,
      bottomCardWidget: _customBot(element),
      );
    opciones.add(Divider(color: Colors.white));
    opciones.add(slimyActual);
    }
  );
  return opciones;
}


Widget _slimyCardMito(List<dynamic> data, BuildContext context){
  return Container(
    padding: EdgeInsets.all(5.0),
    child: SlimyCard(
    color: Colors.deepOrange[100],
    topCardHeight: 160,
    topCardWidget: _customTopMito(data, context),
    bottomCardHeight: 450,
    bottomCardWidget: _customBotMito(data, context),
    )
  );
}

Widget _customTop(dynamic element){
  String _image = element['img-dios'];
  String _titulo = element['nombre-dios'];
  return Container(
    child: Column(
      children: [
        Text(_titulo,style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image: NetworkImage(_image), 
                    placeholder: AssetImage('asset/loading.gif'),
                    height: 250,
                    fit: BoxFit.contain
                    ) 
            ),
      ]
    )
  );
}

Widget _customBot(dynamic element){
  String _descripcion = element['dios'];
  return Container(
    child: ListView(
      children: [
        Text(_descripcion,style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ]
    )
  );
}


Widget _customTopMito(List<dynamic> data, BuildContext context){
  return Container(
    child: Text(data.elementAt(1)['aztecas']['nombre-mito'], style: TextStyle(color: Colors.black, fontSize: 30.0)),
  );
} 

Widget _customBotMito(List<dynamic> data, BuildContext context){
  return Container(
    child: ListView(
      children: [
        Text(data.elementAt(1)['aztecas']['mito'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ]
    )
  );
}