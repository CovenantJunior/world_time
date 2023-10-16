import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // Location for the UI
  late String time; // Location Time
  late String flag; // Location Flag URL
  late String url; // Location for API
  int isDayTime = 1; // If 1 for sunrise, 2 for daytime, 3 for sunset, 4 for night

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String utcOffset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(utcOffset);

      // Create Datetime() object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utcOffset)));

      // Set time props
      // isDayTime = (now.hour >= 6 && now.hour <= 18) ? true : false;
      if (now.hour >= 6 && now.hour < 7) {
        isDayTime = 1;
      } else if (now.hour >= 7 && now.hour < 17) {
        isDayTime = 2;
      } else if (now.hour >= 17 && now.hour < 19) {
        isDayTime = 3;
      } else if (now.hour >= 19 && now.hour < 6) {
        isDayTime = 4;
      }
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = 'Failed to fetch';
    }
  }
}
