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

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green, // navigation bar color
    statusBarColor: Colors.green, // status bar color
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Agronomist',
    theme: ThemeData(
      primarySwatch: Colors.green,
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


    },
  ));
}