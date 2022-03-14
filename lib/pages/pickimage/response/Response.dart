import 'package:agronomist/pages/pickimage/responseloading/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:agronomist/controller/imageHandler.dart';

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
                  season: snapshot.data!['season'],
                  region: snapshot.data!['region'],
                  description: snapshot.data!['description'],
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
    required this.season,
    required this.region,
    required this.description,

  }) : super(key: key);

  final String name;
  final String season;
  final String region;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'poppinsmed',
                  ),
                ),
                SizedBox(height: 50,)
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Season :',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppinsmed',
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  season,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppins',
                  ),
                ),
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Region :',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppinsmed',
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  region,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'poppins',
                  ),
                ),
              ],

            ),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                'Description',
                style: const TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  fontFamily: 'poppinsmed',
                ),
              ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    // fontWeight: FontWeight.w300,
                    fontFamily: 'poppins',
                  ),
                ),
            ],),


          ],
        ),
      );
  }
}