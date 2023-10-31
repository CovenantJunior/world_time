import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class UserTime {
  late String location; // Location for the UI
  late String time; // Location Time
  late String flag; // Location Flag URL
  late String url; // Location for API
  late int seconds; // Get seconds for prospective calculations
  int isDayTime =
      0; // If 1 for sunrise, 2 for daytime, 3 for sunset, 4 for night

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

  Future<void> getUserTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/ip'));

      Map data = jsonDecode(response.body);
      location = extractLocation(data['timezone']);
      url = data['timezone'];
      flag = "";
      String datetime = data['datetime'];
      String utcOffset = data['utc_offset'].substring(1, 3);
      // print(datetime);

      // Determine the sign of the UTC offset (+ or -)
      bool isNegativeOffset = data['utc_offset'].startsWith('-');
      utcOffset = utcOffset.substring(1); // Remove the sign

      // print(datetime);
      // print(utcOffset);

      // Create Datetime() object
      DateTime now = DateTime.parse(datetime);
      if (isNegativeOffset) {
        now = now.subtract(Duration(hours: int.parse(utcOffset)));
      } else {
        now = now.add(Duration(hours: int.parse(utcOffset)));
      }

      seconds = now.second;
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
      time = DateFormat.jm().format(now);
      print('Fetched successfully');
    } catch (e) {
      location = 'Connection Error\r\nPull to Refresh';
      DateTime now = DateTime.now();
      time = DateFormat('h:mm a').format(now);
      flag = '';
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
    }
  }
}
