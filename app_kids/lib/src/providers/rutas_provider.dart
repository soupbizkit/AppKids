import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _RutasProvider{
  List<dynamic> rutas = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    rutas = dataJson['rutas'];

    return rutas;
  }
}

final rutasProvider = new _RutasProvider();