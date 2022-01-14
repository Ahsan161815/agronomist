import 'package:flutter/material.dart';
import 'recomentplantcard.dart';

class RecomendPlants extends StatelessWidget {
  const RecomendPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/images/plants/image_2.png",
            title: "Angelica",
            country: "Pakistan",
            price: 440,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/plants/image_3.png",
            title: "Samantha",
            country: "Pakistan",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/plants/image_1.png",
            title: "Samantha",
            country: "Pakistan",
            price: 440,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
