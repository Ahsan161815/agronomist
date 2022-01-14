import 'package:flutter/material.dart';
import 'recomendpcard.dart';

class RecomendPesticides extends StatelessWidget {
  const RecomendPesticides({Key? key}) : super(key: key);

  void test(){
    print('Test');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          RecomendPCard(
            image: "assets/images/pesticide_products/pesticide1.jpg",
            title: "Talstar Pro",
            country: "Pakistan",
            url: 'https://www.amazon.com/s?k=agriculture+pesticides&crid=27DJYLD0E3ZI8&sprefix=agriculture+pesticides%2Caps%2C753&ref=nb_sb_noss',
            price: 640,
          ),
          RecomendPCard(
            image: "assets/images/pesticide_products/pesticide2.jpg",
            title: "Demon Max",
            country: "Pakistan",
            url: 'https://www.amazon.com/s?k=agriculture+pesticides&crid=27DJYLD0E3ZI8&sprefix=agriculture+pesticides%2Caps%2C753&ref=nb_sb_noss',
            price: 2340,
          ),
          RecomendPCard(
            image: "assets/images/pesticide_products/pesticide3.jpg",
            title: "Samantha",
            country: "Pakistan",
            url: 'https://www.amazon.com/s?k=agriculture+pesticides&crid=27DJYLD0E3ZI8&sprefix=agriculture+pesticides%2Caps%2C753&ref=nb_sb_noss',
            price: 810,
          ),
        ],
      ),
    );
  }
}
