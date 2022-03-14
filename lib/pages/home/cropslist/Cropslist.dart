import 'package:flutter/material.dart';

class Cropslist extends StatelessWidget {
  const Cropslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Supported Plants'
        ),
      ),
      body: const Center(
        child: Text(
          'In Progress',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
