import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
       title: Text('América Precolombina')
      ), //AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Mayas");
              }, 
              child: Text(
                'Mayas',
                style: TextStyle(fontSize: 40.0))),
            SizedBox(height: 20),
            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Aztecas");
              }, 
              child: Text(
                'Aztecas',
                style: TextStyle(fontSize: 40.0))),
            SizedBox(height: 20),
            RaisedButton(
              elevation: 5.0,
              color: Colors.yellow[700],
              textColor: Colors.black,
              padding: EdgeInsets.all(20.0),
              splashColor: Colors.red[300],
              onPressed: (){
                print("Cliquié Incas");
              }, 
              child: Text(
                'Incas',
                style: TextStyle(fontSize: 40.0)))
          ],
        ),
      )
    );
  }
}