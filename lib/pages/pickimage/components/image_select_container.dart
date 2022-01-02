import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectContainer extends StatelessWidget {
  // const ImageSelectContainer({Key? key}) : super(key: key);

  final Function pickimagefunction;
  ImageSelectContainer({Key? key, required this.pickimagefunction}) : super(key: key)
  {}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextButton.icon(
            onPressed: (){
              pickimagefunction(ImageSource.camera);
            },
            icon: const Icon(Icons.camera_alt,
              size: 30,
            ),
            label: const Text('Snap From Camera',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: TextButton.icon(
            onPressed: (){
              pickimagefunction(ImageSource.gallery);
            },
            icon: const Icon(Icons.image,
              size: 30,
            ),
            label: const Text('Select From Gallery',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}