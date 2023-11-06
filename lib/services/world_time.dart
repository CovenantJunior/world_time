import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // Location for the UI
  late String time; // Location Time
  late String flag; // Location Flag URL
  late String url; // Location for API
  late String offset; // Offset
  late String theme; // Theme
  int isDayTime =
      0; // If 1 for sunrise, 2 for daytime, 3 for sunset, 4 for night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime(context) async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
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
      print(hourDiff);
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
      print('Fetched successfully');
    } catch (e) {
      // print(e);
      DateTime now = DateTime.now();
      time = DateFormat('h:mm a').format(now);
      Fluttertoast.showToast(
        msg: 'You have lost internet connection',
        toastLength: Toast.LENGTH_SHORT, // Duration of the toast
        gravity: ToastGravity.BOTTOM,   // Position of the toast (e.g., bottom, top, center)
        timeInSecForIosWeb: 1,        // Time to show on iOS and web platforms
        backgroundColor: Colors.black, // Background color of the toast
        textColor: Colors.white,      // Text color of the toast message
        fontSize: 16.0,               // Font size of the message
      );
    }
  }
}
