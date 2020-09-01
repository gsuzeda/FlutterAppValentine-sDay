import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:presente/quemmandapage.dart';
import 'package:presente/resolution.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presente de Dia dos Namorados',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageStage createState() => _HomePageStage();
}

class _HomePageStage extends State<HomePage> {
  bool ballon1 = false,
      ballon2 = false,
      ballon3 = false,
      ballon4 = false,
      ballon5 = false,
      cat = false;
  var proximaPagina;

  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      cat = !cat;
    });

    super.initState();
  }

  void startTransitions() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        ballon1 = !ballon1;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        ballon2 = !ballon2;
      });
    });
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        ballon3 = !ballon3;
      });
    });
    Future.delayed(const Duration(seconds: 12), () {
      setState(() {
        ballon4 = !ballon4;
      });
    });
    Future.delayed(const Duration(seconds: 15), () {
      setState(() {
        ballon5 = !ballon5;
        proximaPagina = () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuemManda()),
            );
          });
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    maxX = MediaQuery.of(context).size.width;
    maxY = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.redAccent));
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: AnimatedOpacity(
              opacity: ballon1 ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: Card(
                elevation: 8,
                color: Colors.white,
                margin: EdgeInsets.all(maxX / 20),
                child: Container(
                  width: maxX / 5,
                  height: maxY / 21,
                  child: Text(
                    "Oi!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: maxX / 17),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: ballon2 ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: Card(
                elevation: 8,
                color: Colors.white,
                margin: EdgeInsets.all(maxX / 20),
                child: Container(
                  width: maxX,
                  height: maxY / 21,
                  child: Text(
                    "Seu pai tem boi 🐮 ? kkkkk",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: maxX / 18),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: ballon3 ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: Card(
                elevation: 8,
                color: Colors.white,
                margin: EdgeInsets.all(maxX / 20),
                child: Container(
                  width: maxX,
                  height: maxY / 7,
                  child: Text(
                    "Seu namorido preparou um presente bem meloso pra ti! 😝",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: maxX / 18),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: ballon4 ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: Card(
                elevation: 8,
                color: Colors.white,
                margin: EdgeInsets.all(maxX / 20),
                child: Container(
                  width: maxX,
                  height: maxY / 7,
                  child: Text(
                    "Você vai ter que adivinhar algumas coisas, então boa sorte!!! kk",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: maxX / 18),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: maxX / 10,
          ),
          Center(
            child: AnimatedOpacity(
              opacity: ballon5 ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: IconButton(
                iconSize: maxX / 9,
                icon: Image.asset(
                  "assets/images/coracao3.gif",
                  fit: BoxFit.fill,
                ),
                onPressed: proximaPagina,
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: cat ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: IconButton(
                iconSize: maxX / 3,
                icon: Image.asset("assets/images/cat.gif"),
                onPressed: () {
                  setState(() {
                    startTransitions();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
