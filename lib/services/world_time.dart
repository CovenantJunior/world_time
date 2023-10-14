import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; // Location for the UI
  late String time; // Location Time
  late String flag; // Location Flag URL
  late String url; // Location for API

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
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

    time = now.toString();
  }
}
