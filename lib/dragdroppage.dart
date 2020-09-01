import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presente/resolution.dart';
import 'package:presente/textpage.dart';

import 'avatar.dart';

class DragDropPage extends StatefulWidget {
  @override
  _DragDropPageStage createState() => _DragDropPageStage();
}

class _DragDropPageStage extends State<DragDropPage> {
  double positionXLarissa = 1,
      positionYLarissa = 1,
      positionXUzeda = 1,
      positionYUzeda = 1,
      _sizeCard = 0;
  bool _uzedamovido = false, _amorOpacity = false, _larissamovida = false;
  var proximaPagina;

  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        _sizeCard = maxY / 2 + maxX / 5;
        positionYUzeda = maxY * 3 / 4;
        positionYLarissa = positionYUzeda;
        positionXUzeda = maxX * 1 / 5 - maxX / 7;
        positionXLarissa = maxX * 4 / 5 - maxX / 7;
      });
    });

    super.initState();
  }

  void mostraTexto() {
    setState(() {
      _amorOpacity = !_amorOpacity;
      proximaPagina = () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TextPage()),
          );
        });
      };
    });
  }

  void aumentacard() {
    double margin = maxX / 5;
    Timer.periodic(Duration(milliseconds: 3), (timer) {
      setState(() {
        if (_sizeCard < (maxY - margin)) {
          _sizeCard++;
        }
      });
      if (_sizeCard >= (maxY - margin)) {
        mostraTexto();
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            height: _sizeCard,
            width: maxX,
            top: maxX / 10,
            left: 0,
            child: DragTarget(
              builder: (context, List<String> candidateData, rejectedData) {
                return Container(
                  child: Card(
                    margin: EdgeInsets.all(maxX / 20),
                    shadowColor: Colors.black,
                    elevation: 20,
                  ),
                );
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (data) {
                if (data == "Uzeda") {
                  setState(() {
                    _uzedamovido = true;
                    positionYUzeda = maxY * 2.5 / 10;
                    positionXUzeda = maxX * 1 / 10;
                    if (_uzedamovido && _larissamovida) {
                      _uzedamovido = false;
                      _larissamovida = false;
                      aumentacard();
                    }
                  });
                }
                if (data == "Larissa") {
                  _larissamovida = true;
                  setState(() {
                    positionYLarissa = maxY * 2.5 / 10;
                    positionXLarissa = maxX * 6.2 / 10;
                    if (_uzedamovido && _larissamovida) {
                      _uzedamovido = false;
                      _larissamovida = false;
                      aumentacard();
                    }
                  });
                }
              },
            ),
          ),
          Positioned(
            top: positionYUzeda,
            height: maxX / 3.5,
            width: maxX / 3.5,
            left: positionXUzeda,
            child: Draggable(
              child: Avatar(endereco: "assets/images/uzeda.bmp"),
              feedback: Avatar(
                  endereco: "assets/images/uzeda.bmp",
                  altura: maxX / 3.5,
                  largura: maxX / 3.5),
              childWhenDragging: Container(),
              data: "Uzeda",
            ),
          ),
          Positioned(
            top: positionYLarissa,
            height: maxX / 3.5,
            width: maxX / 3.5,
            left: positionXLarissa,
            child: Draggable(
              child: Avatar(endereco: "assets/images/larissa.bmp"),
              feedback: Avatar(
                  endereco: "assets/images/larissa.bmp",
                  altura: maxX / 3.5,
                  largura: maxX / 3.5),
              childWhenDragging: Container(),
              data: "Larissa",
            ),
          ),
          Positioned(
            height: maxX / 3.5,
            width: maxX / 3.5,
            top: maxY * 2.5 / 10,
            left: maxX / 2 - maxX / 7,
            child: Icon(
              Icons.add,
              color: Colors.redAccent,
              size: maxX / 4,
            ),
          ),
          Positioned(
              height: maxX / 2,
              width: maxX * 3 / 4,
              top: maxY / 2,
              left: maxX / 2 - maxX * 3 / 8,
              child: AnimatedOpacity(
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                opacity: _amorOpacity ? 1.0 : 0.0,
                child: Text(
                  "Felicidade sem fim! ",
                  style: TextStyle(
                    fontFamily: 'Love',
                    color: Colors.red,
                    fontSize: maxX / 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
          Positioned(
            height: maxX / 10,
            left: maxX / 2 - maxX / 20,
            width: maxX / 10,
            bottom: maxY / 5,
            child: AnimatedOpacity(
              opacity: _amorOpacity ? 1 : 0,
              duration: Duration(seconds: 3),
              curve: Curves.linear,
              child: IconButton(
                iconSize: maxX / 10,
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: proximaPagina,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
