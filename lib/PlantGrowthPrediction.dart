import 'pages/pickimage/components/ImagePickerWidget.dart';
import 'package:flutter/material.dart';

class PlantGrowthPrediction extends StatelessWidget {
  const PlantGrowthPrediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Growth Prediction'),
      ),
      body: const ImagePickerWidget(),
    );
  }
}
