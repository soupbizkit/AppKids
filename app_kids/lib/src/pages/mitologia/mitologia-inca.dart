import 'package:app_kids/src/providers/culturas_provider.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

class MitologiaInca extends StatelessWidget {
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
            padding: EdgeInsets.all(20.0),
            children: [
              _slimyCardDios1(snapshot.data, contex),
              SizedBox(height: 20),
              _slimyCardDios2(snapshot.data, contex),
              SizedBox(height: 20),
              _slimyCardDios3(snapshot.data, contex),
              SizedBox(height: 20),
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

Widget _slimyCardDios1(List<dynamic> data, BuildContext context){
  return SlimyCard(
    color: Colors.deepOrange[200],
    topCardWidget: _customTopPrimerDios(data, context),
    bottomCardHeight: 200,
    bottomCardWidget: _customBotPrimerDios(data, context),
  );
}

Widget _slimyCardDios2(List<dynamic> data, BuildContext context){
  return SlimyCard(
    color: Colors.deepOrange[200],
    topCardWidget: _customTopSegundoDios(data, context),
    bottomCardHeight: 200,
    bottomCardWidget: _customBotSegundoDios(data, context),
  );
}

Widget _slimyCardDios3(List<dynamic> data, BuildContext context){
  return SlimyCard(
    color: Colors.deepOrange[200],
    topCardWidget: _customTopTercerDios(data, context),
    bottomCardHeight: 200,
    bottomCardWidget: _customBotTercerDios(data, context),
  );
}

Widget _slimyCardMito(List<dynamic> data, BuildContext context){
  return SlimyCard(
    color: Colors.deepOrange[200],
    topCardHeight: 160,
    topCardWidget: _customTopMito(data, context),
    bottomCardHeight: 450,
    bottomCardWidget: _customBotMito(data, context),
  );
}


Widget _customTopPrimerDios(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['nombre-dios1'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image: NetworkImage(data.elementAt(1)['incas']['img-dios-1']), 
                    placeholder: AssetImage('assets/loading.gif'),
                    height: 250,
                    fit: BoxFit.cover
                    ) 
            ),
      ]
    )
  );
}

Widget _customBotPrimerDios(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['dios1'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ]
    )
  );
}

Widget _customTopSegundoDios(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['nombre-dios2'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image: NetworkImage(data.elementAt(1)['incas']['img-dios-2']), 
                    placeholder: AssetImage('assets/loading.gif'),
                    height: 250,
                    fit: BoxFit.cover
                    ) 
            ),
      ]
    )
  );
}

Widget _customBotSegundoDios(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['dios2'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ]
    )
  );
}

Widget _customTopTercerDios(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['nombre-dios3'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: FadeInImage(
                    image: NetworkImage(data.elementAt(1)['incas']['img-dios-3']), 
                    placeholder: AssetImage('assets/loading.gif'),
                    height: 250,
                    fit: BoxFit.cover
                    ) 
            ),
      ]
    )
  );
}

Widget _customBotTercerDios(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['dios3'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ]
    )
  );
}

Widget _customTopMito(List<dynamic> data, BuildContext context){
  return Container(
    child: Text(data.elementAt(1)['incas']['nombre-mito'], style: TextStyle(color: Colors.black, fontSize: 30.0)),
  );
} 

Widget _customBotMito(List<dynamic> data, BuildContext context){
  return Container(
    child: Column(
      children: [
        Text(data.elementAt(1)['incas']['mito'],style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ]
    )
  );
}