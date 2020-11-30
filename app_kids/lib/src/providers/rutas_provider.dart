import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;



class _RutasProvider{
  List<dynamic> rutas = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    rutas = dataJson['rutasMenu'];

    return rutas;
  }
}

class _RutasIncasProvider{
  List<dynamic> rutasIncas = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    rutasIncas = dataJson['rutasIncas'];

    return rutasIncas;
  }
}

class _RutasAztecasProvider{
  List<dynamic> rutasAztecas = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    rutasAztecas = dataJson['rutasAztecas'];

    return rutasAztecas;
  }
}

class _RutasMayasProvider{
  List<dynamic> rutasMayas = [];

  Future <List<dynamic>> cargarDatos() async{
    final resp = await rootBundle.loadString('data/info.json');

    Map dataJson = json.decode(resp);
    rutasMayas = dataJson['rutasMayas'];

    return rutasMayas;
  }
}

final rutasIncasProvider = new _RutasIncasProvider();
final rutasAztecasProvider = new _RutasAztecasProvider();
final rutasMayasProvider = new _RutasMayasProvider();
final rutasCulturasProvider = new _RutasProvider();