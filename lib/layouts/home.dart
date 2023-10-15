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
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose_location');
                },
                child: const Row(
                  children: <Widget>[
                    Icon(Icons.edit_location),
                    Text('Choose Location'),
                  ],
                ),
              ),
          ],
        )
      ),
    );
  }
}
