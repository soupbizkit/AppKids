import 'package:flutter/material.dart';

import 'package:app_kids/src/pages/creacion_botones.dart';

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
      child: botones()
      )
    );
  }
}
