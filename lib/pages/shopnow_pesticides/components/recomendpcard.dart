import 'package:agronomist/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class RecomendPCard extends StatelessWidget {
   const RecomendPCard({
    Key? key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.url,
    // this.press,
  }) : super(key: key);

  final String? image, title, country;
  final int? price;
  final String? url;
  // final Function? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          GestureDetector(
            // behavior: HitTestBehavior.translucent,
            onTap: () => launch(
              url!,
              enableJavaScript: true,
              forceWebView: true,
            ),
            child: Column(
              children: [
                Container(child: Image.asset(image!), width: 160, height: 190, color: Colors.white70,),
                Container(
                  padding: const EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
