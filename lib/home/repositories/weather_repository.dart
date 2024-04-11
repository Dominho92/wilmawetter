import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';
import '../models/city.dart';

class WeatherRepository {
  Future<Weather> getWeather() async {
    await Future.delayed(const Duration(seconds: 2));
    const url =
        'https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';
    final response = await http
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
