import 'package:agronomist/pages/constants.dart';
import 'package:flutter/material.dart';
// import 'package:agronomist/pages/constants.dart';
import 'package:agronomist/components/AppText.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';



class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                // Colors.white,
                // Colors.grey,
                Color(0xfffdfbfb),
                Color(0xffebedee),
              ],
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Text('Hello'),
              CategoryWidget(
                size: size,
                title: "Pesticides",
                imageadrs: 'assets/images/category/cat1.jpg',
                function: (){
                  launch(
                    'https://www.amazon.com/s?k=agriculture+pesticides&crid=27DJYLD0E3ZI8&sprefix=agriculture+pesticides%2Caps%2C753&ref=nb_sb_noss',
                    enableJavaScript: true,
                    forceWebView: true,
                  );
                  // Navigator.pushNamed(context, '/shopnow_pesticides');
                },
              ),
              SizedBox(height: 20,),
              CategoryWidget(
                size: size,
                title: "Plants",
                imageadrs: 'assets/images/category/cat2.jpg',
                function: (){
                  // Navigator.pushNamed(context, '/shopnow_plants');
                  launch(
                    'https://www.amazon.com/s?k=plants&crid=1CA0JZUTKCALL&sprefix=plant%2Caps%2C628&ref=nb_sb_noss',
                    enableJavaScript: true,
                    forceWebView: true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.size,
    this.title = 'Title goes here',
    required this.function,
    required this.imageadrs
  }) : super(key: key);

  final Size size;
  final String title;
  final String imageadrs;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageadrs.toString()),
            fit: BoxFit.cover,
            // opacity: 0.6,
          ),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 7), // changes position of
          ),],
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white70,
        ),
        // color: Colors.red,
        height: size.height/3,
        width: size.width,
        child: Center(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: AppText(
              text: title,
              lspacing: 2.0,
              fontSize: 25.0,
              color: kTitleTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg",color: Colors.white,),
      onPressed: () {},
    ),
  );
}