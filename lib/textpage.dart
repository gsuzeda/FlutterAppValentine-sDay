import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:presente/finalpage.dart';
import 'package:presente/resolution.dart';

class TextPage extends StatefulWidget {
  TextPage({Key key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  bool animatedOPCT = false;

  void initState() {
    Future.delayed(const Duration(seconds: 35), () {
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Center(
              child: Card(
                elevation: 8,
                margin: EdgeInsets.all(maxX / 20),
                color: Colors.white,
                child: Container(
                  height: maxY * 3.2 / 4,
                  width: maxX,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: maxY / 40,
                      ),
                      TyperAnimatedTextKit(
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 100),
                        text: [
                          "Enquanto um busca o \nprimeiro raio de sol, ☀️\n"
                              "o outro se econtra \nnas estrelas, 🌠\n"
                              "Se amam? Com certeza. ❤️\n"
                              "Pois durante o dia, \n mesmo fraca, \na lua sempre aparece\n"
                              "e de noite, o sol a aquece."
                              "\n\nPodemos ter nossas diferenças\n"
                              "Podemos ter nossas brigas\n"
                              "mas acima de tudo nos amamos,\n"
                              "nós lutamos pelo nosso futuro\n"
                              "pois queremos que ele aconteça"
                        ],
                        textStyle: TextStyle(
                            color: Colors.red,
                            fontSize: maxX / 20,
                            fontFamily: 'Leidies'),
                        alignment: Alignment.center,
                        textAlign: TextAlign.center,
                        // totalRepeatCount: 1,
                      ),
                      AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        opacity: animatedOPCT ? 1 : 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Somos ",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: maxX / 17,
                                  fontFamily: 'Leidies'),
                            ),
                            RotateAnimatedTextKit(
                              text: ["AMANTES", "UM", "DETERMINADOS", "FORTES"],
                              textStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: maxX / 17,
                                  fontFamily: 'Roboto'),
                              repeatForever: true,
                              textAlign: TextAlign.right,
                              // or Alignment.topLeft
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: maxY / 40,
            ),
            Center(
              child: IconButton(
                iconSize: maxX / 10,
                icon: Image.asset(
                  "assets/images/coracao3.gif",
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinalPage()),
                  );
                },
              ),
            ),
          ]),
    );
  }
}
