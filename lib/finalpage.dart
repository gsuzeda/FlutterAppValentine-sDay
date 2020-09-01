import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:presente/resolution.dart';

class FinalPage extends StatefulWidget {
  FinalPage({Key key}) : super(key: key);

  @override
  _FinalPageState createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  bool animatedOPCT = false;

  void initState() {
    Future.delayed(const Duration(seconds: 13), () {
      setState(() {
        animatedOPCT = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Card(
                  elevation: 8,
                  margin: EdgeInsets.all(maxX / 20),
                  color: Colors.white,
                  child: Container(
                    height: maxY * 3.5 / 4,
                    width: maxX,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: maxY / 10,
                        ),
                        TyperAnimatedTextKit(
                          isRepeatingAnimation: false,
                          speed: Duration(milliseconds: 100),
                          text: [
                            "❤❤ Feliz dia ❤❤\n"
                                "dos namorados meu amor!\n"
                                "Espero que tenha gostado\n"
                                "❤Te amo ❤\n"
                                "Até o infinito e voltando!\n"
                          ],
                          textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: maxX / 15,
                              fontFamily: 'Leidies'),
                          alignment: Alignment.center,
                          textAlign: TextAlign.center,
                          // totalRepeatCount: 1,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            curve: Curves.linear,
                            opacity: animatedOPCT ? 1 : 0,
                            child: Image.asset(
                              "assets/images/cat2.gif",
                              width: maxX * 2 / 3,
                              height: maxY * 1 / 4,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ]),
    );
  }
}
