import 'dart:io';
import 'package:flutter/material.dart';
import 'package:world_time/layouts/home.dart';
import 'package:world_time/layouts/choose_location.dart';
import 'package:world_time/layouts/preloader.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const Preloader(),
        '/home' : (context) => const Home(),
        '/choose_location' : (context) => const ChooseLocation()
      },
    )
  );
}