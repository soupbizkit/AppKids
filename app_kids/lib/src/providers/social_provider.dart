import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _CulturasProvider{
  List<dynamic> opciones = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    opciones = dataJson['social'];

    return opciones;
  }
}

final culturaProvider = new _CulturasProvider();