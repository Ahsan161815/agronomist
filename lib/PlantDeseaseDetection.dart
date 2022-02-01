import 'package:agronomist/main.dart';

import 'pages/pickimage/ImagePickerWidget.dart';
import 'package:flutter/material.dart';
import 'package:agronomist/pages/pickimage/ImagePickerWidget.dart';

class PlantDiseaseDetection extends StatelessWidget {
  const PlantDiseaseDetection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Plant Disease Detection'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index)
        {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/recognition');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: pcolor,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: const Icon(
                  Icons.pageview_outlined,
                  color: Colors.white54,
                  size: 80,
                ),
              ),
            ),
          );
        }
      ),

      ),
    );
  }
}

