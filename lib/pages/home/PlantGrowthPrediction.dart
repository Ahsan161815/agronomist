import '../pickimage/ImagePickerWidget.dart';
import 'package:flutter/material.dart';

class PlantGrowthPrediction extends StatelessWidget {
  const PlantGrowthPrediction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Crop Yield Prediction'),
      ),
      body: const ImagePickerWidget(),
    );
  }
}
