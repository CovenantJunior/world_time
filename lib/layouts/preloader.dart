import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  void fetchData() async {
    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    Map data = jsonDecode(response.body);
    print(data['title']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading...'),
    );
  }
}
