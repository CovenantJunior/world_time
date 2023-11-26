import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String weatherIcon;
  final String dayTime;
  final String temperature;

  const ForecastCard({
    super.key, 
    required this.weatherIcon,
    required this.dayTime,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              weatherIcon,
              width: 50, // Adjust the size of the weather icon
              height: 50,
            ),
            const SizedBox(height: 10),
            Text(
              dayTime,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              temperature,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}