import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _OpcionesProvider{
  List<dynamic> opciones = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    opciones = dataJson['opciones'];

    return opciones;
  }
}

final opcionesProvider = new _OpcionesProvider();