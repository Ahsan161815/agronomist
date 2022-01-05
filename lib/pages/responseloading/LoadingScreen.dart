import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          semanticsLabel: "loading Screen",
          color: Colors.green,
          // strokeWidth: 2,
          // backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
