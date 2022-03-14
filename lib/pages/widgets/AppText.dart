import 'package:agronomist/main.dart';
import 'package:agronomist/pages/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final HexColor color = HexColor('#517348');

class AppText extends StatelessWidget {

  final String text;
  final double fontSize;
  final double lspacing;
  final Color color;

  const AppText({
    Key? key,
    this.text = 'App Text Widget',
    this.fontSize = 20.0,
    this.lspacing = 1.0,
    this.color = testcolor,
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
