import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';


class ImageHandler{

  XFile? _image;
  File? f_image;
  // ImageHandler( this._image);

  // picks image and returns image file
  Future pickImage(ImageSource source) async {
    try {
      _image = await ImagePicker().pickImage(source: source, ); //maxHeight: 150, maxWidth: 150
      if (_image == null) return;

       // f_image = File(_image!.path);

      f_image = await cropImage(File(_image!.path));


      // setState(() {
      //   this._image = imageTemporary;
      // });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File?> cropImage(File imagefile) async => await ImageCropper.cropImage(
    sourcePath: imagefile.path,
  );

  Future<Map> upload(File imageFile) async {
    // open a bytestream
    // var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    String? r;
    var stream  = http.ByteStream(imageFile.openRead());
    stream.cast();

    // get file length
    var length = await imageFile.length();

    // string to uri
    // var uri = Uri.parse("http://10.102.130.246:5000/");
    // var uri = Uri.parse("http://10.102.130.30:5000/");
    var uri = Uri.parse("http://192.168.1.5:5000/");
    // var uri = Uri.parse("https://agro-nomist.azurewebsites.net//");

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

    // print(response.toString());
    // print(response.stream.);
   //  var rstring = String.fromCharCodes(rdata);
    // print(jsonDecode(rstring));

    var to_str = String.fromCharCodes(rdata);

    // CustomTranslator t = CustomTranslator();
    // var translated = await t.translate(rstring);
    // var to_str = translated.toString();

    // print(jsonDecode(to_str)['name']);
    // print(jsonDecode(to_str)['description']);

    Map toMap = {};

    // var striped = to_str.split(":");
    // print(striped);
    toMap['name'] = jsonDecode(to_str)['name'];
    toMap['season'] = jsonDecode(to_str)['season'];
    toMap['region'] = jsonDecode(to_str)['region'];
    toMap['description'] = jsonDecode(to_str)['description'];

    print(toMap);
    // print(translated);

    // print(to_str);
    return toMap;

  }
}