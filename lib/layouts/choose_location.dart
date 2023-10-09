import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose a location'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: const Center(
        child: SafeArea(
          child: Text(
            'Choose Location',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
