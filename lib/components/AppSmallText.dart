import 'package:agronomist/pages/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final HexColor color = HexColor('#517348');

class AppSmallText extends StatelessWidget {

  final String text;
  final fontSize;
  final lspacing;
  final Color color;

  const AppSmallText({
    Key? key,
    this.text = 'App Small Text Widget',
    this.fontSize = 16.0,
    this.lspacing = 1.0,
    this.color = testcolor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'roboto',
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: lspacing,
      ),
    );
  }
}
