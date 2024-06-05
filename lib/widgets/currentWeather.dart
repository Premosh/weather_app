import 'package:flutter/material.dart';
import 'package:flutter_project/model/weather_current.dart';
class CurrentWeather extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeather({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${weatherDataCurrent.current.temp}'),
    );
  }
}
