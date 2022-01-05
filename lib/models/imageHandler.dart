import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class ImageHandler{

  XFile? _image;
  File? f_image;
  // ImageHandler( this._image);

  // picks image and returns image file
  Future pickImage(ImageSource source) async {
    try {
      _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      f_image = File(_image!.path);

      // setState(() {
      //   this._image = imageTemporary;
      // });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<String> upload(File imageFile) async {
    // open a bytestream
    // var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    String? r;
    var stream  = http.ByteStream(imageFile.openRead());
    stream.cast();

    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://10.102.130.246:5000/");

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
    // response.stream.transform(utf8.decoder).listen((value) {
    //   // print(value);
    //   r = value;
    //
    // });
    var rdata = await response.stream.toBytes();
    var rstring = String.fromCharCodes(rdata);
    print(rstring);
    return rstring;

  }



}