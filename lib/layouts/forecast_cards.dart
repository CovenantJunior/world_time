import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
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
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                    child: CachedNetworkImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      imageUrl: weatherIcon, // Update as needed
                      placeholder: (context, url) => const CircularProgressIndicator(
                        value: null,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        backgroundImage: AssetImage('images/flags/timezone.png'),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      ),
                      height: 50,
                      width: 50,
                    ),
                ),
                const SizedBox(height: 10),
                Text(
                  dayTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'MontserratAlternates',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  temperature,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'MontserratAlternates',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}