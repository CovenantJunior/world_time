import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/user_time.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  String time = 'Loading...';

  void setupWorldTime() async {
    /* WorldTime init =
        WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo');
    await init.getTime(); */
    // print(init.time);
    /* setState(() {
      time = init.time;
    }); */

    // Use the UserTime() class
    UserTime init =
        UserTime();
    await init.getUserTime();

    print('Fetched successfully');
    // ignore: use_build_context_synchronously
    await Navigator.pushReplacementNamed(context, '/home', arguments: {
      'url': init.url,
      'location': init.location,
      'flag': init.flag,
      'time': init.time,
      'seconds': init.seconds,
      'isDayTime': init.isDayTime
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
      backgroundColor: Colors.blue[900],
      body: const SafeArea(
        child: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.white,
            size: 100,
          ),
        )
      ),
    );
  }
}
