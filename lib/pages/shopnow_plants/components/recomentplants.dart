import 'package:flutter/material.dart';
import 'recomentplantcard.dart';

class RecomendPlants extends StatelessWidget {
  const RecomendPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          RecomendPlantCard(
            image: "assets/images/plants/image_2.png",
            title: "Angelica",
            country: "Pakistan",
            price: 440,
            url: 'https://www.amazon.com/s?k=plants&crid=1CA0JZUTKCALL&sprefix=plant%2Caps%2C628&ref=nb_sb_noss',
          ),
          RecomendPlantCard(
            image: "assets/images/plants/image_3.png",
            title: "Samantha",
            country: "Pakistan",
            url: 'https://www.amazon.com/s?k=plants&crid=1CA0JZUTKCALL&sprefix=plant%2Caps%2C628&ref=nb_sb_noss',
            price: 440,
          ),
          RecomendPlantCard(
            image: "assets/images/plants/image_1.png",
            title: "Samantha",
            country: "Pakistan",
            price: 440,
            url: 'https://www.amazon.com/s?k=plants&crid=1CA0JZUTKCALL&sprefix=plant%2Caps%2C628&ref=nb_sb_noss',
          )
        ],
      ),
    );
  }
}
