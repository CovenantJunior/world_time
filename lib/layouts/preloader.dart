import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  void getTime() async {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String utc_offset = data['utc_offset'];

    // print(datetime);
    // print(utc_offset);

    // Create Datetime() object
    DateTime now = DateTime.parse(datetime);
    // now.add()
    // print(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading...'),
    );
  }
}
