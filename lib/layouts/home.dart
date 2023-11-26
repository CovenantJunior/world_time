import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_time/layouts/forecast_cards.dart';
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
          'temperatureF': init.temperatureF,
          'conditionTitle': init.conditionTitle,
          'conditionIcon': init.conditionIcon
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
          // print(data['time']);
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
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  Center(
                    child: Text(
                      getCity(cleanString(data['location'])),
                      style: TextStyle(
                        color: (data['isDayTime'] == 2) ? Colors.black : Colors.white,
                        fontSize: 50,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  ClipOval(
                    child: CachedNetworkImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      imageUrl: "https:${data['conditionIcon']}", // Update as needed
                      placeholder: (context, url) => const CircularProgressIndicator(
                        value: null,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        backgroundImage: AssetImage('images/flags/timezone.png'),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "${data['temperatureC'].ceil()} °C", // The superscripted part
                      style: TextStyle(
                        color: (data['isDayTime'] == 2) ? Colors.black : Colors.white,
                        fontSize: 50, // Adjust the font size for the superscript
                        fontFamily: 'MontserratAlternates',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      data['conditionTitle'],
                      style: TextStyle(
                      color: (data['isDayTime'] == 2) ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontFamily: 'MontserratAlternates',
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(height: 10),
                  Center(
                    child: Text(
                          data['time'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'MontserratAlternates',
                              fontWeight: FontWeight.normal),
                        ),
                  ),
                  const Divider(height: 20),
                  /* const Expanded(
                    child: ListTile()
                  ), */
                  const Divider(height: 20),
                  // Forecast
                  SizedBox(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                        ForecastCard(
                          weatherIcon: "https:${data['conditionIcon']}",
                          dayTime: data['time'],
                          temperature:  "${data['temperatureC'].ceil()} °C",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.edit_location,
            color: Colors.white,
          ),
        ),
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
      ),
    );
  }
}
