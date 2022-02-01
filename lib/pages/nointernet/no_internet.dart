import 'package:agronomist/components/AppText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white30,
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.signal_wifi_statusbar_connected_no_internet_4,
            size: 200,
            color: Colors.black12,
          ),
          SizedBox(height: 30,),
          AppText(text:'No Internet Connection', fontSize: 22,
            color: Colors.redAccent,
          ),
          AppText(text:'Please make sure you are connected to the Internet',
            color: Colors.black26,
          ),
        ],
      ),

    );
  }
}
