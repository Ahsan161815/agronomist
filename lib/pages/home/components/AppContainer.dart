import 'package:agronomist/components/AppText.dart';
import 'package:agronomist/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppContainer extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function function;
  final String tag;
  final Color bgColor;
  final Color containerColor;
  final Color iconPlusText;
  final Color titleColor;


  AppContainer({
    required this.title,
    required this.tag,
    required this.icon,
    required this.function,
    this.bgColor = Colors.grey,
    this.iconPlusText = Colors.grey,
    this.containerColor = Colors.white70,
    this.titleColor = testcolor,
  }
    );

  // const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: bgColor.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 7), // changes position of
          ),],
          borderRadius: BorderRadius.circular(20.0),

            color: containerColor,
        ),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //color: Colors.green,
        height: 150,
        width: 150,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Icon(
                icon,
                color: iconPlusText,
                size: 25,
              ),
            ),
            Positioned(child: AppText(
              text: title,
              lspacing: 0.0,
              color: titleColor,
            ), left: 20, top:70,
            ),
            Positioned(child: Text(
              tag,
              style: TextStyle(
                color: iconPlusText,
                letterSpacing: 1,
              ),
            ), left: 20, bottom:40,
            ),
          ],
        ),
      ),
    );
  }
}
