import 'dart:io';

import 'package:apisaissai/home/homePage.dart';
import 'package:apisaissai/message_push/view/generateNot.dart';
import 'package:flutter/material.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main(List<String> args) {
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {

 
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PushNot(),
      title: "Moto Tv",
    );
  }
}