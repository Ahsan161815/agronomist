import 'package:agronomist/components/AppText.dart';
import 'package:agronomist/pages/shopnow/components/titlewithmorebtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agronomist/pages/constants.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'featurred_plants.dart';
// import 'header_with_seachbox.dart';
// import 'recomend_plants.dart';
// import 'title_with_more_bbtn.dart';
import 'package:agronomist/pages/constants.dart';
import 'package:flutter/services.dart';

class Body extends StatelessWidget {
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
          TitleWithMoreBtn(title: 'Recommended Plants'),
          RecomendPlants(),
          TitleWithMoreBtn(title: 'Famous Plants'),
          RecomendPlants()
        ],
      ),
    );
  }
}

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
                "Pakistan's Best Plants",
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
                child: CustomTextField(),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        // fontSize: 20,
        fontFamily: 'poppins',
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Searh',
        hintStyle: const TextStyle(
          letterSpacing: 5,
        ),
        contentPadding:
        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(25.7),
        ),
    ),
          );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String? image, title, country;
  final int? price;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image!),
          GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\Pkr $price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecomendPlants extends StatelessWidget {
  const RecomendPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/images/image_2.png",
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
            image: "assets/images/image_3.png",
            title: "Samantha",
            country: "Pakistan",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/image_1.png",
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
