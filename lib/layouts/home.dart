import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    timeRefresh(data);
  }

  Future<void> timeRefresh(Map data) async {
    WorldTime init = WorldTime(
        location: data['location'],
        flag: data['location'],
        url: data['url']); // Access data directly
    await init.getTime();
    setState(() {
      this.data = {
        'url': init.url,
        'location': init.location,
        'flag': init.flag,
        'time': init.time,
        'isDayTime': init.isDayTime
      };
    });

  @override
  Widget build(BuildContext context) {
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

    // print(data);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => timeRefresh(data),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(theme), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
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
        ),
      ),
    );
  }
}
