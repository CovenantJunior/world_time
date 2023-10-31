import 'dart:async';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  String cleanString(String originalString) {
    String modifiedString = originalString.replaceAll('_', ' ');
    return modifiedString;
  }

  @override
  Widget build(BuildContext context) {
    /* void scheduleCustomUpdate(Function timeUpdate, int seconds) {
      Duration timeOut =
          const Duration(seconds: 60) - Duration(seconds: seconds);

      Future.delayed(timeOut, () {
        timeUpdate(data);
      });
    } */

    Future<void> timeUpdate(Map data) async {
      WorldTime init = WorldTime(
          location: data['location'],
          flag: data['location'],
          url: data['url']); // Access data directly
      await init.getTime();
      setState(() {
        this.data = {
          'url': init.url,
          'location': init.location,
          'flag': init.flag,
          'time': init.time,
          'isDayTime': init.isDayTime
        };
        // scheduleCustomUpdate(timeUpdate, init.seconds);
      });
    }

    void minuteChangeDetector() {
      DateTime lastTime = DateTime.now();

      Timer.periodic(const Duration(seconds: 1), (_) {
        final currentTime = DateTime.now();
        if (currentTime.minute != lastTime.minute) {
          Future.delayed(const Duration(seconds: 7), () {
            timeUpdate(data);
          });
        }
        lastTime = currentTime;
      });
    }

    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    minuteChangeDetector();

    String theme = '';

    if (data['isDayTime'] == 1) {
      theme = 'images/sunrise.jpg';
    } else if (data['isDayTime'] == 2) {
      theme = 'images/day.jpg';
    } else if (data['isDayTime'] == 3) {
      theme = 'images/sunset.jpg';
    } else if (data['isDayTime'] == 4) {
      theme = 'images/night.jpg';
    } else {
      theme = 'images/night-landscape.jpg';
    }

    // print(data);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => timeUpdate(data),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(theme), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      // Navigator.pushNamed(context, '/choose_location');
                      dynamic result = await Navigator.pushNamed(
                          context, '/choose_location');
                      setState(() {
                        data = {
                          'url': result['url'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime']
                        };
                        // scheduleCustomUpdate(timeUpdate, result['seconds']);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  cleanString(data['location']),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Icon(Icons.edit_location, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 30),
                  /* const Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ), */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          data['time'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontFamily: 'MontserratAlternates',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
