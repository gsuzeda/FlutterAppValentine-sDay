import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final endereco, largura, altura;

  const Avatar({
    Key key,
    @required this.endereco,
    this.largura,
    this.altura,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      width: largura,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: Colors.redAccent, width: 5),
        image: DecorationImage(image: AssetImage(endereco), fit: BoxFit.cover),
      ),
    );
  }
}
