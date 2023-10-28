import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  String cleanString(String originalString) {
    String modifiedString = originalString.replaceAll('_', ' ');
    return modifiedString;
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    String theme = '';

    if (data['isDayTime'] == 1) {
      theme = 'images/sunrise.jpg';
    } else if (data['isDayTime'] == 2) {
      theme = 'images/day.jpg';
    } else if (data['isDayTime'] == 3) {
      theme = 'images/sunset.jpg';
    } else if (data['isDayTime'] == 4) {
      theme = 'images/night.jpg';
    } else {
      theme = 'images/night-landscape.jpg';
    }

    print(data);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(theme),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
              onPressed: () async {
                // Navigator.pushNamed(context, '/choose_location');
                dynamic result = await Navigator.pushNamed(context, '/choose_location');
                setState(() {
                  data = {
                    'location': result['location'],
                    'flag': result['flag'],
                    'time': result['time'],
                    'isDayTime': result['isDayTime']
                  };
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.edit_location, color: Colors.white),
                  Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cleanString(data['location']),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data['time'],
              style: const TextStyle(color: Colors.white, fontSize: 60),
            ),
          ],
        ),
              ),
      ),
    );
  }
}
