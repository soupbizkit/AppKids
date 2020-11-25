import 'package:flutter/material.dart';

import 'package:app_kids/src/pages/home_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
            child: HomePage()
            ),
    );
  }
}