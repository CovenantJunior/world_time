import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  /* void fetchData () async {
    // Simulate data request ()Async Test)
    String phrase1 = await Future.delayed(const Duration(seconds: 3), () {
      return "Tea is a Guru";
    });

    String phrase2 = await Future.delayed(const Duration(seconds: 10), () {
      return "Tea is Badass";
    });

    print('$phrase1 - $phrase2');
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState() function running...');
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print('build() function running...');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose a location'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: SafeArea(
          child: Text(
            'Choose $counter Location',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
