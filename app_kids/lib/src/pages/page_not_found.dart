import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class PageNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
              backgroundColor: Colors.orange,
              title: BorderedText( 
                  strokeWidth: 3.0,
                  strokeColor: Colors.black,
                  child: Text(
                    'Página no encontrada',
                    style: TextStyle(
                    color: Colors.white))),
      ), //AppBar
      body: Center(
        child: Image.asset(
          "asset/notFound.gif",
        ),//Text('The page you are trying to reach does not exist', style: TextStyle(fontSize: 30)),
      )
    );
  }
}