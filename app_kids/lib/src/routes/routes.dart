import 'package:app_kids/src/pages/estructuraSocial/social_aztecas.dart';
import 'package:app_kids/src/pages/estructuraSocial/social_incas.dart';
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
import 'package:app_kids/src/pages/mitologia/mitologia-azteca.dart';
import 'package:app_kids/src/pages/mitologia/mitologia-inca.dart';
import 'package:app_kids/src/pages/mitologia/mitologia-maya.dart';
import 'package:app_kids/src/pages/retoPage/reto_page.dart';

Map <String, WidgetBuilder> getAppRoutes(){
  return <String, WidgetBuilder>{
        '/'         : (BuildContext context) => HomePage(),
        'Incas'     : (BuildContext context) => IncasPage(),
        'Aztecas'   : (BuildContext context) => AztecasPage(),
        'Mayas'     : (BuildContext context) => MayasPage(),
        'ubicacion-incas' : (BuildContext context) => UbicacionIncas(),
        'ubicacion-aztecas' : (BuildContext context) => UbicacionAztecas(),
        'ubicacion-mayas' : (BuildContext context) => UbicacionMayas(),
        'social-mayas' : (BuildContext context) => SocialMayas(),
        'social-incas' : (BuildContext context) => SocialIncas(),
        'social-aztecas' : (BuildContext context) => SocialAztecas(),
        'mitologia-aztecas' : (BuildContext context) => MitologiaAzteca(),
        'mitologia-incas' : (BuildContext context) => MitologiaInca(),
        'mitologia-mayas' : (BuildContext context) => MitologiaMaya(),
        'reto'   : (BuildContext context) => MyReto(),
        
  };

}
