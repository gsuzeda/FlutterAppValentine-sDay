import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presente/dialogopage.dart';
import 'package:presente/resolution.dart';

class QuemManda extends StatefulWidget {
  @override
  _QuemMandaState createState() => _QuemMandaState();
}

class _QuemMandaState extends State<QuemManda> {
  bool animatedText = false,
      animatedButtons = false,
      completed = false,
      completed1 = false,
      completed2 = false,
      completed3 = false,
      animatedUzedaButton = false,
      hasPressed = false,
      animatedLarissaButton = false;
  var proximaPagina;
  String buttonLabel = "Larissa";
  double fakePosition = 0;

  void irParaProximaPagina() {
    proximaPagina = () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DialogoPage()),
        );
      });
    };
  }

  void initState() {
    fakePosition = maxY * 1.7 / 5;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        animatedText = !animatedText;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        animatedButtons = true;
        animatedUzedaButton = true;
        animatedLarissaButton = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "\nQuiz do Casal",
              style: TextStyle(
                  fontSize: maxX / 8,
                  color: Colors.white,
                  fontFamily: 'Bidgey'),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: completed ? 1 : 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: Image.asset(
                  "assets/images/coracao3.gif",
                  height: maxY / 10,
                  width: maxX / 5,
                ),
                iconSize: maxX / 5,
                onPressed: proximaPagina,
              ),
            ),
          ),
          Positioned(
            height: maxY / 5,
            width: maxX,
            top: maxY * 1.2 / 5,
            left: maxX / 2 - (maxX) / 2,
            child: AnimatedOpacity(
              opacity: animatedText ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Text(
                "Quem é o mais peidorreiro?",
                style: TextStyle(
                    fontSize: maxX / 15,
                    fontFamily: 'Liebe',
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            height: maxY / 5,
            width: maxX,
            top: maxY * 2.2 / 5,
            left: maxX / 2 - maxX / 2,
            child: AnimatedOpacity(
              opacity: animatedText ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Text(
                "Quem é o mais chato?",
                style: TextStyle(
                    fontSize: maxX / 15,
                    fontFamily: 'Liebe',
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            height: maxY / 5,
            width: maxX,
            top: maxY * 3.2 / 5,
            left: maxX / 2 - maxX / 2,
            child: AnimatedOpacity(
              opacity: animatedText ? 1 : 0,
              duration: Duration(seconds: 1),
              child: Text(
                "Quem é o mais romântico?",
                style: TextStyle(
                    fontSize: maxX / 16,
                    fontFamily: 'Liebe',
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            height: maxY / 20,
            width: maxX / 3,
            top: fakePosition,
            left: maxX * 4 / 5 - maxX / 6,
            child: AnimatedOpacity(
              opacity: animatedButtons ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  " Uzeda ",
                  style: TextStyle(
                      fontSize: maxX / 16,
                      fontFamily: 'Roboto',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    if (fakePosition == maxY * 1.7 / 5 ||
                        fakePosition == maxY * 1.5 / 5) {
                      fakePosition = maxY * 1.9 / 5;
                    } else {
                      fakePosition = maxY * 1.5 / 5;
                    }
                  });
                },
              ),
            ),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 3,
            top: maxY * 2.7 / 5,
            left: maxX * 4 / 5 - maxX / 6,
            child: AnimatedOpacity(
              opacity: animatedUzedaButton ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  " Uzeda ",
                  style: TextStyle(
                      fontSize: maxX / 16,
                      fontFamily: 'Roboto',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    animatedUzedaButton = false;
                  });
                },
              ),
            ),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 3,
            top: maxY * 3.7 / 5,
            left: maxX * 4 / 5 - maxX / 6,
            child: AnimatedOpacity(
              opacity: animatedButtons ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  " Uzeda ",
                  style: TextStyle(
                      fontSize: maxX / 16,
                      fontFamily: 'Roboto',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    completed3 = true;
                  });
                  if (completed1 && completed2 && completed3) {
                    setState(() {
                      completed = true;
                      irParaProximaPagina();
                    });
                  }
                },
              ),
            ),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 3,
            top: maxY * 3.7 / 5,
            left: maxX / 5 - maxX / 6,
            child: AnimatedOpacity(
              opacity: animatedButtons ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlatButton(
                color: Colors.white,
                child: AnimatedOpacity(
                  opacity: animatedLarissaButton ? 1 : 0,
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    buttonLabel,
                    style: TextStyle(
                        fontSize: maxX / 16,
                        fontFamily: 'Roboto',
                        color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  if (hasPressed) {
                    setState(() {
                      completed3 = true;
                    });
                    if (completed1 && completed2 && completed3) {
                      setState(() {
                        completed = true;
                        irParaProximaPagina();
                      });
                    }
                  } else {
                    hasPressed = true;
                    setState(() {
                      animatedLarissaButton = false;
                    });

                    Future.delayed(const Duration(milliseconds: 500), () {
                      setState(() {
                        buttonLabel = " Uzeda ";
                        animatedLarissaButton = true;
                      });
                    });
                  }
                },
              ),
            ),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 3,
            top: maxY * 1.7 / 5,
            left: maxX / 5 - maxX / 6,
            child: AnimatedOpacity(
              opacity: animatedButtons ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  "Larissa",
                  style: TextStyle(
                      fontSize: maxX / 16,
                      fontFamily: 'Roboto',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    completed1 = true;
                  });
                  if (completed1 && completed2 && completed3) {
                    setState(() {
                      completed = true;
                      irParaProximaPagina();
                    });
                  }
                },
              ),
            ),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 3,
            top: maxY * 2.7 / 5,
            left: maxX / 5 - maxX / 6,
            child: AnimatedOpacity(
              opacity: animatedButtons ? 1 : 0,
              duration: Duration(seconds: 1),
              child: FlatButton(
                color: Colors.white,
                child: Text(
                  "Larissa",
                  style: TextStyle(
                      fontSize: maxX / 16,
                      fontFamily: 'Roboto',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  setState(() {
                    completed2 = true;
                  });
                  if (completed1 && completed2 && completed3) {
                    setState(() {
                      completed = true;
                      irParaProximaPagina();
                    });
                  }
                },
              ),
            ),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 5,
            top: maxY * 1.7 / 5,
            left: maxX / 2 - maxX / 10,
            child: AnimatedOpacity(
                opacity: completed1 ? 1 : 0,
                duration: Duration(seconds: 1),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: maxX / 10,
                )),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 5,
            top: maxY * 2.7 / 5,
            left: maxX / 2 - maxX / 10,
            child: AnimatedOpacity(
                opacity: completed2 ? 1 : 0,
                duration: Duration(seconds: 1),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: maxX / 10,
                )),
          ),
          Positioned(
            height: maxY / 20,
            width: maxX / 5,
            top: maxY * 3.7 / 5,
            left: maxX / 2 - maxX / 10,
            child: AnimatedOpacity(
                opacity: completed3 ? 1 : 0,
                duration: Duration(seconds: 1),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: maxX / 10,
                )),
          ),
        ],
      ),
    );
  }
}
