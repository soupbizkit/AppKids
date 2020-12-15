import 'dart:async';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:app_kids/src/pages/retoPage/tablero.dart';

class MyReto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: new Reto(),
    );
  }
}

class Reto extends StatefulWidget {
  RetoState createState() => new RetoState();
}

class RetoState extends State<Reto> {
  int score = 0;
  int time = 0;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), runTimer);
  }

  void runTimer() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        this.time += 1;
        runTimer();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("asset/imagenFondo.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24.0),
                  buildScore(),
                  buildBoard()
                ],
              ),
            )
        )
      ]
    );
  }

  Widget buildScore() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BorderedText( 
                  strokeWidth: 3.0,
                  strokeColor: Colors.black,
                  child: Text(time.toString() + "s",
                            style: TextStyle(
                                fontSize: 32.0,
                                color: Colors.white,
                                fontFamily: 'GamjaFlower'))
                        
          ),
          BorderedText( 
                  strokeWidth: 3.0,
                  strokeColor: Colors.black,
                  child:Text(score.toString(),
                          style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.white,
                          fontFamily: 'GamjaFlower'))
          )
        ],
      ),
    );
  }

  Widget buildBoard() {
    return Flexible(
        child: Stack(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(6.0), child: CardBoard(onWin: onWin)),
      ],
    ));
  }

  Widget buildGradientView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 32.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black, Colors.transparent])),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 32.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black, Colors.black])),
        )
      ],
    );
  }

  void onWin() {
    setState(() => this.score += 200);
  }
}