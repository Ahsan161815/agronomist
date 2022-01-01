import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {

  final Widget child;
  final Function function;
  AppContainer({  required this.child,  required this.function});

  // const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
            color: Colors.green
        ),
        margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        //color: Colors.green,
        height: 150,
        child: child,
      ),
    );
  }
}
