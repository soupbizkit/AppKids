import 'package:flutter/material.dart';

class MayasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
              backgroundColor: Colors.yellow[700],
              title: Text('Mayas', style: TextStyle(color: Colors.black)), 
      ), //AppBar
      body: Center(
      child: _botonesMayas()
      )
    );
  }
}



Widget _botonesMayas(){
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Ubicación");
              }, 
              child: Text(
                'Ubicación',
                style: TextStyle(fontSize: 40.0))),

            SizedBox(height: 20),

            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Social");
              }, 
              child: Text(
                'Social',
                style: TextStyle(fontSize: 40.0))),

            SizedBox(height: 20),

            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Dios");
              }, 
              child: Text(
                'Dioses',
                style: TextStyle(fontSize: 40.0))),

            SizedBox(height: 20),

            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Reto");
              }, 
              child: Text(
                'Reto',
                style: TextStyle(fontSize: 40.0))),
          ],
        );
  }