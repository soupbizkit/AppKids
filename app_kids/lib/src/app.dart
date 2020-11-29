import 'package:flutter/material.dart';


//propias
import 'package:app_kids/src/routes/routes.dart';
import 'package:app_kids/src/pages/page_not_found.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute  : '/',
      routes        : getAppRoutes() ,
      onGenerateRoute: (RouteSettings settings) {  //si la ruta no existe, se ejecuta esta función
        return MaterialPageRoute(
          builder: (BuildContext context) => PageNotFound());
      },
    );
  }
}