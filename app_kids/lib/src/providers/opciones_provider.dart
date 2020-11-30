import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _RutasIncasProvider{
  List<dynamic> rutasIncas = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    rutasIncas = dataJson['rutasIncas'];

    return rutasIncas;
  }
}

final rutasIncasProvider = new _RutasIncasProvider();