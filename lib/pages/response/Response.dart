import 'package:agronomist/pages/responseloading/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:agronomist/models/imageHandler.dart';

class Response extends StatelessWidget {
  const Response({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isLoading = true;

    ImageHandler img_handler = ( ModalRoute.of(context)?.settings.arguments as Map)["img_handle"] as ImageHandler;
    // print(img_handler.f_image);


    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map>(
          future: img_handler.upload(img_handler.f_image!),
          builder: (
              BuildContext context,
              AsyncSnapshot<Map> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return const LoadingScreen();
            }else if (snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasError){
                return const Text('Error');
              } else if (snapshot.hasData){
                return data(
                  name: snapshot.data!['name'],
                  value: snapshot.data!['value'],
                  body: snapshot.data!['body'],
                );
              }
            } return const Text('none');
          },
        ),
        ),
    );
  }
}

class data extends StatelessWidget {
  const data({
    Key? key,
    required this.name,
    required this.value,
    required this.body,

  }) : super(key: key);

  final String name;
  final String value;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'urduregular',
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'urduregular',
                  ),
                ),
              ],

            ),
            Text(
              body,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'urduregular',
              ),
            ),
          ],
        ),
      );
  }
}