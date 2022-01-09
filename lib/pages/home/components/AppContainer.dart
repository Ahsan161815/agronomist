import 'package:agronomist/components/AppText.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppContainer extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function function;
  final String tag;

  AppContainer({
    required this.title,
    required this.tag,
    required this.icon,
    required this.function}
    );

  // const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 7), // changes position of
          ),],
          borderRadius: BorderRadius.circular(20.0),

            color: Colors.white70,
        ),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //color: Colors.green,
        height: 150,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Icon(
                icon,
                color: Colors.blueGrey,
                size: 40,
              ),
            ),
            Positioned(child: AppText(
              text: title,
            ), left: 20, top:70,
            ),
            Positioned(child: Text(
              tag,
            ), left: 20, bottom:30,
            ),
          ],
        ),
      ),
    );
  }
}
