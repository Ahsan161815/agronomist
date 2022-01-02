import 'pages/pickimage/ImagePickerWidget.dart';
import 'package:flutter/material.dart';
import 'package:agronomist/pages/pickimage/ImagePickerWidget.dart';

class PlantDiseaseDetection extends StatelessWidget {
  const PlantDiseaseDetection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Disease Detection'),
      ),
      body: const ImagePickerWidget(),
    );
  }
}
