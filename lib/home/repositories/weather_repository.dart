import 'package:http/http.dart' as http;
import 'package:wilmawetter/home/models/city.dart';
import 'dart:convert';
import '../models/weather.dart';

class WeatherRepository {
  Future<Weather> getWeather(City city) async {
    await Future.delayed(const Duration(seconds: 2));
    final url =
        'https://api.open-meteo.com/v1/forecast?latitude=${city.latitude}&longitude=${city.longitude}&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';
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
