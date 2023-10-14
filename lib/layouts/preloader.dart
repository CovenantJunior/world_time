import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime init =
        WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo');
    await init.getTime();
    // print(init.time);
    /* setState(() {
      time = init.time;
    }); */
    print('Fetched successfully');
    await Navigator.pushReplacementNamed(context, '/home', arguments: {
      init.location,
      init.flag,
      init.time
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(time)),
    );
  }
}
