import 'package:flutter/material.dart';
import 'package:world_time/layouts/home.dart';
import 'package:world_time/layouts/choose_location.dart';
import 'package:world_time/layouts/preloader.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/' : (context) => const Preloader(),
        '/home' : (context) => const Home(),
        '/choose_location' : (context) => const ChooseLocation()
      },
    )
  );
}