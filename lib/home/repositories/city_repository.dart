import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wilmawetter/home/models/city.dart';

class CityRepository {
  static const _apiKey = 'rYkezFAMBbcNtarWsjzSIQ==ERbAaz9XBucuDcNt';

  Future<City> getCity(
    String city,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    final url = 'https://api.api-ninjas.com/v1/geocoding?city=$city';
    final response =
        await http.get(Uri.parse(url), headers: {'X-Api-Key': _apiKey});
    if (response.statusCode == 200) {
      ('response: ${response.body}');
      print(response.body);
      final jsonData = jsonDecode(response.body);
      return City.fromJson(jsonData[0]);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
