import 'pages/home/Home.dart';
import 'pages/chat/Chat.dart';
import 'pages/cropslist/Cropslist.dart';
import 'pages/introduction/Introduction.dart';
import 'PlantRecognition.dart';
import 'PlantDeseaseDetection.dart';
import 'PlantGrowthPrediction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/response/Response.dart';
import 'pages/responseloading/LoadingScreen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:agronomist/pages/shopnow/ShopNow.dart';

final HexColor pcolor = HexColor('#517348');

void main() {
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
    routes: {
      '/':(context) => const Introduction(),
      '/home':(context) => const Home(),
      '/cropslist':(context) => const Cropslist(),
      '/chat':(context) => const Chat(),
      '/recognition':(context) => const PlantRecognition(),
      '/disease':(context) => const PlantDiseaseDetection(),
      '/growth':(context) => const PlantGrowthPrediction(),
      '/response':(context) => const Response(),
      '/responseloading':(context) => const LoadingScreen(),
      '/shopnow' : (context) => const ShopNow(),

    },
  ));
}