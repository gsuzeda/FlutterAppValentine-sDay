import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:presente/resolution.dart';
import 'package:presente/slideshowpage.dart';

class DialogoPage extends StatefulWidget {
  @override
  _DialogoPageStage createState() => _DialogoPageStage();
}

class _DialogoPageStage extends State<DialogoPage> {
  bool ballon1 = false,
      ballon2 = false,
      ballon3 = false,
      ballon4 = false,
      ballon5 = false,
      coracaobarra = false;
  var proximaPagina;

  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        coracaobarra = true;
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      startTransitions();
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
              MaterialPageRoute(builder: (context) => SlideShowPage()),
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

    SystemChrome.setEnabledSystemUIOverlays([]);

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
                  width: maxX / 3,
                  height: maxY / 21,
                  child: Text(
                    "Oi dnv! 😀",
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
                    "Foi fácil de acertar né? 😝",
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
                    "Essa foi minha vingança pelo moedor de café! ☕ \n Hahahaha",
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
                    "Mas agora começam as coisas fofinhas de verdade! 😊 Está pronta? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: maxX / 18),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          SizedBox(
            height: maxY / 20,
          ),
          Center(
            child: AnimatedOpacity(
              opacity: ballon5 ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: IconButton(
                iconSize: maxX / 10,
                icon: Image.asset(
                  "assets/images/coracao3.gif",
                  fit: BoxFit.fill,
                ),
                onPressed: proximaPagina,
              ),
            ),
          ),
          SizedBox(
            height: maxY / 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: coracaobarra ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: Image.asset("assets/images/coracaobarra.gif"),
            ),
          ),
        ],
      ),
    );
  }
}
