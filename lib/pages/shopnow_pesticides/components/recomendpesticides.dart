import 'package:flutter/material.dart';
import 'recomendpcard.dart';

class RecomendPesticides extends StatelessWidget {
  const RecomendPesticides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPCard(
            image: "assets/images/pesticide_products/pesticide1.jpg",
            title: "Talstar Pro",
            country: "Pakistan",
            price: 640,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => DetailsScreen(),
              //   ),
              // );
            },
          ),
          RecomendPCard(
            image: "assets/images/pesticide_products/pesticide2.jpg",
            title: "Demon Max",
            country: "Pakistan",
            price: 2340,
            press: () {},
          ),
          RecomendPCard(
            image: "assets/images/pesticide_products/pesticide3.jpg",
            title: "Samantha",
            country: "Pakistan",
            price: 810,
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
