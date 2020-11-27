import 'package:flutter/material.dart';

import 'package:app_kids/src/pages/creacion_botones.dart';

class AztecasPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
              backgroundColor: Colors.yellow[700],
              title: Text('Aztecas', style: TextStyle(color: Colors.black)), 
      ), //AppBar
      body: Center(
      child: botones()
      )
    );
  }
}
