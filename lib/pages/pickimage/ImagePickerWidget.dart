import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:agronomist/models/imageHandler.dart';
import 'package:agronomist/pages/pickimage/components/image_select_container.dart';


class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  // File? _image;
  ImageHandler imghandler = ImageHandler();

  void setPickImage(ImageSource source) async {
      await imghandler.pickImage(source);
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
            "Select OR Capture an Image",
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: HexColor('#517348'),
            ),
          ),
        ),),
        Expanded(
          child: Center(
            child: imghandler.f_image != null ?
            Image.file(imghandler.f_image!,
              width: 350,
              height: 350,) :
            Icon(
              Icons.image_not_supported_outlined,
              size: 100,
              color: HexColor('#517348'),),
          ),
        ),
        imghandler.f_image == null ? ImageSelectContainer(pickimagefunction: setPickImage,) :
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextButton.icon(
            onPressed: () async {

              // Nevigate to response with response data
              Navigator.pushNamed(context, "/response",
                arguments: {"img_handle": imghandler}
              );

            },
            icon: const Icon(Icons.navigate_next,
              size: 30,
            ),
            label: const Text('Start Process',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}