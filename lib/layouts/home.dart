import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_time/services/world_time.dart';
// import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late int isDayTime;
  late String theme;

  String cleanString(String originalString) {
    String modifiedString = originalString.replaceAll('_', ' ');
    return modifiedString;
  }

  String getCity(location) {
    List<String> parts = location.split(' / ');
    if (parts.length >= 2) {
      String result = parts[1];
      return result;
    } else {
      return location;
    }
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

    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    // ignore: non_constant_identifier_names
    Future<void> TimezoneUpdate(BuildContext context) async {
      WorldTime init = WorldTime(
          location: data['location'],
          flag: data['location'],
          url: data['url']); // Access data directly
      await init.getTime(context);
      setState(() {
        data = {
          'url': init.url,
          'location': init.location,
          'flag': init.flag,
          'time': init.time,
          'offset': init.offset,
          'isDayTime': init.isDayTime,
          'theme': init.theme
        };
        // scheduleCustomUpdate(timeUpdate, init.seconds);
      });
    }

    bool isNegativeOffset = data['offset'].startsWith('-');/* 

    Future<void> timeUpdate(Map data) async {
      var currentTime = DateTime.now();
      if (isNegativeOffset) {
        currentTime = currentTime.subtract(Duration(hours: int.parse(data['offset'])));
      } else {
        currentTime = currentTime.add(Duration(hours: int.parse(data['offset'])));
      }
      setState(() {
        data['time'] = DateFormat('h:mm a').format(currentTime);
        // scheduleCustomUpdate(timeUpdate, init.seconds);
      });
    } */


    Timer? _timer; // Declare the timer as an instance variable

    void minuteChangeDetector() {

      DateTime lastTime = DateTime.now();

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        var currentTime = DateTime.now();
        if (currentTime.minute != lastTime.minute) {
          int hour = currentTime.timeZoneOffset.inHours;
          String offset = data['offset'].substring(1, 3);
          int hourDiff = int.parse(offset) - hour;
          if (isNegativeOffset) {
            currentTime = currentTime.subtract(Duration(hours: hourDiff));
          } else {
            currentTime = currentTime.add(Duration(hours: hourDiff));
          }

          if (currentTime.hour >= 6 && currentTime.hour < 7) {
            isDayTime = 1;
          } else if (currentTime.hour >= 7 && currentTime.hour < 17) {
            isDayTime = 2;
          } else if (currentTime.hour >= 17 && currentTime.hour < 19) {
            isDayTime = 3;
          } else if (currentTime.hour >= 19) {
            isDayTime = 4;
          } else if (currentTime.hour < 6) {
            isDayTime = 4;
          }

          if (isDayTime == 1) {
            theme = 'images/sunrise.jpg';
          } else if (isDayTime == 2) {
            theme = 'images/day.jpg';
          } else if (isDayTime == 3) {
            theme = 'images/sunset.jpg';
          } else if (isDayTime == 4) {
            theme = 'images/night-landscape.jpg';
          } else {
            theme = 'images/night-landscape.jpg';
          }

          setState(() {
            data['isDayTime'] = DateFormat('h:mm a').format(currentTime);
            data['theme'] = theme;
          });
          print(data['time']);
          lastTime = currentTime;
          _timer?.cancel(); // Cancel any previous timer if it exists
        }
      });
    }


    minuteChangeDetector();

    // print(data);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          TimezoneUpdate(context);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data['theme']), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'Choose Location',
                    child: TextButton(
                      onPressed: () async {
                        // Navigator.pushNamed(context, '/choose_location');
                        dynamic result = await Navigator.pushNamed(
                            context, '/choose_location');
                        setState(() {
                          data = {
                            'url': result['url'],
                            'location': result['location'],
                            'flag': result['flag'],
                            'time': result['time'],
                            'offset': result['offset'],
                            'isDayTime': result['isDayTime'],
                            'theme': result['theme']
                          };
                          // print(data);
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
                                    getCity(cleanString(data['location'])),
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
