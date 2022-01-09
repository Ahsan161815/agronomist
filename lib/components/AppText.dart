import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final HexColor color = HexColor('#517348');

class AppText extends StatelessWidget {

  final text;
  final fontSize = 28.0;
  final lspacing = 1.0;

  const AppText({
    Key? key,
    required this.text,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'robotobold',
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: lspacing,
      ),
    );
  }
}
