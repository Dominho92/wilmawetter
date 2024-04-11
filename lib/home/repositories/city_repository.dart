import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wilmawetter/home/models/city.dart';

class WeatherRepository {
  static const _apiKey = 'rYkezFAMBbcNtarWsjzSIQ==ERbAaz9XBucuDcNt';

  Future<City> getWeather(
    String city,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    final url = 'https://api.api-ninjas.com/v1/weather?city=$city';
    final response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': _apiKey});
    if (response.statusCode == 200) {
      ('response: ${response.body}');
      return City.fromJson(jsonDecode(
        response.body,
      ));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
