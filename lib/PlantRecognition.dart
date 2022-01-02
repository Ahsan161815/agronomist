import 'pages/pickimage/ImagePickerWidget.dart';
import 'package:flutter/material.dart';

class PlantRecognition extends StatelessWidget {
  const PlantRecognition({Key? key}) : super(key: key);
//
//   @override
//   State<PlantRecognition> createState() => _PlantRecognitionState();
// }
//
// class _PlantRecognitionState extends State<PlantRecognition> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Identification'),
      ),
      body: const ImagePickerWidget(),

    );
  }
}