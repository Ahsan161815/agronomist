import 'package:flutter/material.dart';
import 'components/ImagePickerWidget.dart';

class CustomImagePicker extends StatelessWidget {
  // const CustomImagePicker({Key? key}) : super(key: key);
  String? title;
  CustomImagePicker({Key? key, this.title}) : super(key: key)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const ImagePickerWidget(),
    );
  }
}
