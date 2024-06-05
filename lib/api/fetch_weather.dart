import 'dart:convert';

import '../model/weather_current.dart';
import '../model/weather_daily.dart';
import '../model/weather_data.dart';
import '../model/weather_hourly.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  WeatherData? weatherData;
  static const String baseUrl = 'https://api.open-meteo.com/v1/forecast';

  // processing the data from response -> to json
  Future<WeatherData> processData(lat, long) async {
    final response = await http.get(Uri.parse('$baseUrl?latitude=$lat&longitude=$long&hourly=temperature_2m&current_weather=true&daily=temperature_2m_max,temperature_2m_min'));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}
