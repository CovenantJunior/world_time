import 'package:flutter/material.dart';
import 'package:world_time/services/timezones.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  TimeZones timezones = TimeZones();

  WorldTime location = WorldTime(location: '', url: '', flag: '');

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
