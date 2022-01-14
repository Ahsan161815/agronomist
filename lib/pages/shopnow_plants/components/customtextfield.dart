import 'package:flutter/material.dart';
import 'package:agronomist/pages/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        // fontSize: 20,
        fontFamily: 'poppins',
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Searh',
        hintStyle: const TextStyle(
          letterSpacing: 5,
        ),
        contentPadding:
        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
    );
  }
}
