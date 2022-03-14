import 'pages/home/Home.dart';
import 'pages/home/chat/Chat.dart';
import 'pages/home/cropslist/Cropslist.dart';
import 'pages/introduction/Introduction.dart';
import 'pages/home/PlantRecognition.dart';
import 'pages/home/PlantDeseaseDetection.dart';
import 'pages/home/PlantGrowthPrediction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/pickimage/response/Response.dart';
import 'pages/pickimage/responseloading/LoadingScreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:agronomist/pages/consult/components/consultdetailscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final HexColor pcolor = HexColor('#517348');

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  var prefs = await SharedPreferences.getInstance();
  bool firstTime = false;
  bool? check = prefs.getBool('firstTime');
  print(check);
  if(check == null){
    prefs.setBool('firstTime', false);
    firstTime = true;
  }else{
    firstTime = false;
    prefs.setBool('firstTime', false);
  }


  // bool firstTime = false;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: pcolor, // navigation bar color
    statusBarColor: pcolor, // status bar color
    statusBarIconBrightness: Brightness.light,

  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Agronomist',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: pcolor,
      ),

    ),
    initialRoute: firstTime ? '/intro':'/home',
    routes: {
      '/home':(context) => const Home(),
      '/cropslist':(context) => const Cropslist(),
      '/chat':(context) => const Chat(),
      '/recognition':(context) => const PlantRecognition(),
      '/disease':(context) => const PlantDiseaseDetection(),
      '/growth':(context) => const PlantGrowthPrediction(),
      '/response':(context) => const Response(),
      '/responseloading':(context) => const LoadingScreen(),
      '/consultdetail' : (context) => const DetailScreen(),
      '/intro':(context) => const Introduction(),
    },
  ));
}