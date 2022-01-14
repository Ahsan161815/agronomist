import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/giff.gif",
          height: 125.0,
          width: 125.0,
        ),
        // CircularProgressIndicator(
        //   semanticsLabel: "loading Screen",
        //   color: Colors.green,
        //   // strokeWidth: 2,
        //   // backgroundColor: Colors.green,
        // ),
      ),
    );
  }
}
