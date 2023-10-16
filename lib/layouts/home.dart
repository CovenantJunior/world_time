import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context)?.settings.arguments as Map;

    print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose_location');
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.edit_location),
                    Text('Choose Location'),
                  ],
                ),
              ),
              const SizedBox(
                height: 0
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 30
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data['time'],
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 60
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
