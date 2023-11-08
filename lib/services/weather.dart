import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class Weather {
  late double temperatureC;
  late double temperatureF;
  late String condition;
  late String location;
  late String time;
  late String windSpeed;
  late String humidity;
  late String precipitation;
  late String sunriseTime;
  late String sunsetTime;
  late String pressure;
  late String uvIndex;
  late List forecastDays;

  Weather({required location});

  Future<void> getWeather() async {
    try {
      Response response = await get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=4407b42fea084ec7818225848233010&q=Manila&days=2&aqi=yes&alerts=yes'));
      Map data = jsonDecode(response.body);
      Map current = data['current'];
      forecastDays = data['forecast']['forecastday'];
      temperatureC = current['temp_c'];
      temperatureF = current['temp_f'];
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: 'No internet connection, pull down to refresh',
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