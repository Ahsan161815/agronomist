import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  File? _image;
  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      final imageTemporary = File(_image.path);
      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  upload(File imageFile) async {
    // open a bytestream
    // var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

    var stream  = http.ByteStream(imageFile.openRead());
    stream.cast();

    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.1.5:5000/");

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Select or Capture an Image of a plant',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300
                // fontFamily: "Verdana",
              ),

            ),
          ),
        ),
        Expanded(
          child: Center(
            child: _image != null ?
            Image.file(_image!,
              width: 350,
              height: 350,) :
            const Icon(
              Icons.image_not_supported_outlined,
              size: 100,
              color: Colors.green,),
          ),
        ),
        _image == null ? ImageSelectContainer(pickimagefunction: pickImage,) :
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextButton.icon(
            onPressed: (){
              upload(_image!);
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