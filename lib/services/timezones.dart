import 'package:http/http.dart';

class TimeZones {
  
  Future<void> getTimezOnes() async {
    Response timzones =
        // await get(Uri.parse('http://worldtimeapi.org/api/timezone/'));
    
    print(timzones);
  }
}
