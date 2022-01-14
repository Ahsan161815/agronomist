import 'package:flutter/material.dart';
import 'package:agronomist/pages/constants.dart';
import 'customtextfield.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: HexColor('#517348'),
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
          color: pColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )
      ),
      child: Stack(
        children: [
          const Positioned(
            child: Center(
              child: Text(
                "Pakistan's Best Pesticides",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            bottom: 70,
            left: 1,
            right: 1,
          ),
          Positioned(
            child: Center(
              child: SizedBox(
                width: size.width / 1.2,
                child: const CustomTextField(),
              ),
            ),
            bottom: 5,
            left: 1,
            right: 1,
          ),
        ],
      ),
      // const AppText(),

      // HeaderWithSearchBox(size: size),
      // TitleWithMoreBtn(title: "Recomended", press: () {}),
      // RecomendsPlants(),
      // TitleWithMoreBtn(title: "Featured Plants", press: () {}),
      // FeaturedPlants(),
      // SizedBox(height: kDefaultPadding),
    );
  }
}
