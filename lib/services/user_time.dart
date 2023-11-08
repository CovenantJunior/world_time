import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:world_time/services/weather.dart';

class UserTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late String offset;
  late String theme;
  int isDayTime = 0;
  late double temperatureC;
  late double temperatureF;
  late String conditionTitle;
  late String conditionIcon;

  UserTime();

  String extractLocation(timezone) {
    String timeZone = timezone;

    List<String> parts = timeZone.split('/');
    if (parts.length > 2) {
      String mainLocation = "${parts[1]} / ${parts[2]}";
      return mainLocation; // This will print "Argentina / Buenos_Aires"
    } else if (parts.length == 2) {
      String mainLocation = parts[1];
      return mainLocation;
    } else {
      String mainLocation = parts[0];
      return mainLocation;
    }
  }

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

  Future<void> getUserTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/ip'));

      Map data = jsonDecode(response.body);
      location = extractLocation(data['timezone']);
      url = data['timezone'];
      flag = "";
      offset = data['utc_offset'];
      String utcOffset = data['utc_offset'].substring(1, 3);
      // print(datetime);

      // Determine the sign of the UTC offset (+ or -)
      // bool isNegativeOffset = data['utc_offset'].startsWith('-');
      utcOffset = utcOffset.substring(1); // Remove the sign

      // print(datetime);
      // print(utcOffset);

      // Create Datetime() object
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);

      int myOffset = now.timeZoneOffset.inHours;
      int remoteOffset = int.parse(offset.split(':')[0]);
      int hourDiff = remoteOffset - (myOffset);
      if (myOffset > remoteOffset) {
        now = now.subtract(Duration(hours: -hourDiff));
      } else {
        now = now.add(Duration(hours: hourDiff));
      }

      // Set time props
      // isDayTime = (now.hour >= 6 && now.hour <= 18) ? true : false;
      if (now.hour >= 6 && now.hour < 7) {
        isDayTime = 1;
      } else if (now.hour >= 7 && now.hour < 17) {
        isDayTime = 2;
      } else if (now.hour >= 17 && now.hour < 19) {
        isDayTime = 3;
      } else if (now.hour >= 19) {
        isDayTime = 4;
      } else if (now.hour < 6) {
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
      
      time = DateFormat.jm().format(now);


      // For weather properties
      Weather weather = Weather(location: getCity(cleanString(location)));
      await weather.getWeather();
      conditionTitle = weather.conditionTitle;
      conditionIcon = weather.conditionIcon;
      temperatureC = weather.temperatureC;
      temperatureF = weather.temperatureF;

      print('Fetched successfully');
    } catch (e) {
      location = 'N/A';
      DateTime now = DateTime.now();
      time = DateFormat('h:mm a').format(now);
      flag = '';
      url = '';
      offset = '';

      if (now.hour >= 6 && now.hour < 7) {
        isDayTime = 1;
      } else if (now.hour >= 7 && now.hour < 17) {
        isDayTime = 2;
      } else if (now.hour >= 17 && now.hour < 19) {
        isDayTime = 3;
      } else if (now.hour >= 19) {
        isDayTime = 4;
      } else if (now.hour < 6) {
        isDayTime = 4;
      }

      Fluttertoast.showToast(
        msg: 'No internet connection',
        toastLength: Toast.LENGTH_SHORT, // Duration of the toast
        gravity: ToastGravity
            .BOTTOM, // Position of the toast (e.g., bottom, top, center)
        timeInSecForIosWeb: 1, // Time to show on iOS and web platforms
        backgroundColor: Colors.black, // Background color of the toast
        textColor: Colors.white, // Text color of the toast message
        fontSize: 16.0, // Font size of the message
      );
    }
  }
}
