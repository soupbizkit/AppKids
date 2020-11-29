import 'package:flutter/material.dart';

//propios 
import 'package:app_kids/src/pages/aztecas_page.dart';
import 'package:app_kids/src/pages/home_page.dart';
import 'package:app_kids/src/pages/incas_page.dart';
import 'package:app_kids/src/pages/mayas_page.dart';
import 'package:app_kids/src/pages/ubicacion.dart';

Map <String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
        '/'         : (BuildContext context) => HomePage(),
        'Incas'     : (BuildContext context) => IncasPage(),
        'Aztecas'   : (BuildContext context) => AztecasPage(),
        'Mayas'     : (BuildContext context) => MayasPage(),
        'Ubicacion' : (BuildContext context) => Ubicacion(),
        /*'Social' : (BuildContext context) => SocialPage(),
        'Dioses' : (BuildContext context) => DiosesPage(),
        'Reto'   : (BuildContext context) => RetoPage(),*/
  };

}
