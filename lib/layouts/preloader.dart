import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  void setupWorldTime() async {
    WorldTime init =
        WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo');
    await init.getTime();
    print(init.time);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading...'),
    );
  }
}
