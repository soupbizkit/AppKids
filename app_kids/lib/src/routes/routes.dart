import 'package:flutter/material.dart';

//propios 
import 'package:app_kids/src/pages/culturasPages/aztecas_page.dart';
import 'package:app_kids/src/pages/home_page.dart';
import 'package:app_kids/src/pages/culturasPages/incas_page.dart';
import 'package:app_kids/src/pages/culturasPages/mayas_page.dart';
import 'package:app_kids/src/pages/ubicacion/ubicacion-incas.dart';
import 'package:app_kids/src/pages/ubicacion/ubicacion-aztecas.dart';
import 'package:app_kids/src/pages/ubicacion/ubicacion-mayas.dart';
import 'package:app_kids/src/pages/estructuraSocial/social_mayas.dart';

Map <String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
        '/'         : (BuildContext context) => HomePage(),
        'Incas'     : (BuildContext context) => IncasPage(),
        'Aztecas'   : (BuildContext context) => AztecasPage(),
        'Mayas'     : (BuildContext context) => MayasPage(),
        'ubicacion-incas' : (BuildContext context) => UbicacionIncas(),
        'ubicacion-aztecas' : (BuildContext context) => UbicacionAztecas(),
        'ubicacion-mayas' : (BuildContext context) => UbicacionMayas(),
        'social-mayas' : (BuildContext context) => SocialMayas()
        /*'Dioses' : (BuildContext context) => DiosesPage(),
        'Reto'   : (BuildContext context) => RetoPage(),*/
  };

}
