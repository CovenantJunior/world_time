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
  Timer? _timer; // Declare the timer as an instance variable

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
    Future<void> TimezoneUpdate(context) async {
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
          'theme': init.theme,
          'temperatureC': init.temperatureC,
          'temperatureF': init.temperatureF
        };
        // scheduleCustomUpdate(timeUpdate, init.seconds);
      });
      _timer?.cancel();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Timezone data has been synchronized.')));
    }

    /* bool isNegativeRemoteOffset = data['offset'].startsWith('-');
    bool isNegativeTimeZoneOffset (n) {
      if (n > 0) {
        return false;
      } else if (n < 0) {
        return true;
      } else {
        return false;
      }
    } */
  
  /*
    Future<void> timeUpdate(Map data) async {
      var currentTime = DateTime.now();
      if (isNegativeRemoteOffset) {
        currentTime = currentTime.subtract(Duration(hours: int.parse(data['offset'])));
      } else {
        currentTime = currentTime.add(Duration(hours: int.parse(data['offset'])));
      }
      setState(() {
        data['time'] = DateFormat('h:mm a').format(currentTime);
        // scheduleCustomUpdate(timeUpdate, init.seconds);
      });
    } */



    void minuteChangeDetector() {

      DateTime lastTime = DateTime.now();

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        var currentTime = DateTime.now();
        if (currentTime.minute != lastTime.minute) {
          int myOffset = currentTime.timeZoneOffset.inHours;
          int remoteOffset = int.parse(data['offset'].split(':')[0]);
          int hourDiff = remoteOffset - (myOffset);
          if (myOffset > remoteOffset) {
            currentTime = currentTime.subtract(Duration(hours: -hourDiff));
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
            data['time'] = DateFormat('h:mm a').format(currentTime);
            data['theme'] = theme;
            data['isDayTime'] = isDayTime;
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Synchronizing')));
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
                            'theme': result['theme'],
                            'temperatureC': result['temperatureC'],
                            'temperatureF': result['temperatureF'],
                            'conditionTitle': result['conditionTitle'],
                            'conditionIcon': result['conditionIcon']
                          };
                          // print(data);
                        });
                        _timer?.cancel();
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
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: getCity(cleanString(data['location'])), // The regular text
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 50,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        WidgetSpan(
                                          alignment: PlaceholderAlignment.middle,
                                          child: Baseline(
                                            baseline: -20.0, // Adjust this value for vertical positioning
                                            baselineType: TextBaseline.alphabetic,
                                            child: Text(
                                              " ${data['temperatureC'].toInt()} °C", // The superscripted part
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24, // Adjust the font size for the superscript
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  )
,
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
