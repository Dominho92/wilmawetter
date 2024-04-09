import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';

class WeatherRepository {
  final double latitude = 47.8567;
  final double longitude = 12.3378;
  Future<Weather> fetchWeather() async {
    final String baseUrl =
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return Weather.fromJson(jsonData['current']);
      } else {
        throw Exception('No Weather Data');
      }
    } catch (e) {
      throw Exception('Failed to load Weather $e');
    }
  }
}
