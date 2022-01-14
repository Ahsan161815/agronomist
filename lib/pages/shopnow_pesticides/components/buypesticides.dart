import 'titlewithmorebtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'shopappbar.dart';
import 'recomendpesticides.dart';

class BuyPesticides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShopAppBar(size: size),
          TitleWithMoreBtn(title: 'Recommended Pesticides'),
          RecomendPesticides(),
          TitleWithMoreBtn(title: 'Famous Pesticides'),
          RecomendPesticides()
        ],
      ),
    );
  }
}
