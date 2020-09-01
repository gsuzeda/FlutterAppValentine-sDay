import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presente/resolution.dart';

import 'dragdroppage.dart';

class SlideShowPage extends StatefulWidget {
  @override
  _SlideShowPageState createState() => _SlideShowPageState();
}

class _SlideShowPageState extends State<SlideShowPage> {
  List<Widget> fotos = List();
  bool animatedOPCT = false;

  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () {
      Flame.audio.clearAll();
      Flame.audio.loopLongAudio('musica.mp3');

      setState(() {
        animatedOPCT = !animatedOPCT;
      });
    });

    fotos.add(
      Image.asset(
        "assets/images/Carrosel/1.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/2.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/3.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/4.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/5.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/6.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/7.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/8.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
    fotos.add(
      Image.asset(
        "assets/images/Carrosel/9.jpg",
        width: maxX * 3 / 4,
        height: maxY * 6 / 10,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: AnimatedOpacity(
                  opacity: animatedOPCT ? 1 : 0,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    margin: EdgeInsets.all(maxX / 20),
                    child: Container(
                      width: maxX,
                      height: maxY / 12,
                      child: Text(
                        "Essas são as fotos desde o último dia dos namorados! 🖼️",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: maxX / 20),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  curve: Curves.linear,
                  duration: Duration(seconds: 1),
                  opacity: animatedOPCT ? 1 : 0,
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    child: Container(
                        height: maxY * 3 / 5,
                        width: maxX,
                        margin: EdgeInsets.all(0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1.0,
                            enlargeCenterPage: true,
                            pageViewKey: PageStorageKey('carousel_slider'),
                          ),
                          items: fotos,
                        )),
                  ),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: animatedOPCT ? 1 : 0,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    margin: EdgeInsets.all(maxX / 20),
                    child: Container(
                      width: maxX,
                      height: maxY / 24,
                      child: Text(
                        "Você se lembra de todas? 🤔",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: maxX / 20),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: animatedOPCT ? 1 : 0,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  child: IconButton(
                    iconSize: maxX / 10,
                    icon: Image.asset(
                      "assets/images/coracao3.gif",
                      fit: BoxFit.fill,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DragDropPage()),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: maxY / 20,
              )
            ]));
  }
}
