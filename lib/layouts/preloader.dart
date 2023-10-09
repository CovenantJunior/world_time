import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Preloader extends StatefulWidget {
  const Preloader({super.key});

  @override
  State<Preloader> createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  void fetchData() async {
    Response response =
        get('https://jsonplaceholder.typicode.com/todos/1' as Uri) as Response;
    print(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading...'),
    );
  }
}
