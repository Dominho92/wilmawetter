import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wilmawetter/home/models/weather.dart';

class WeatherRepository {
  final String apiUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';

  Future<Weather> fetchWeather() async {
    final response = await http.get(Uri.parse(apiUrl));
    print(response.body);
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
