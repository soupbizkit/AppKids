import 'package:flutter/material.dart';


class PageNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
              backgroundColor: Colors.red[900],
              title: Text('Página no encontrada', style: TextStyle(color: Colors.white)), 
      ), //AppBar
      body: Center(
        child: Text('The page you are trying to reach does not exist', style: TextStyle(fontSize: 30)),
      )
    );
  }
}