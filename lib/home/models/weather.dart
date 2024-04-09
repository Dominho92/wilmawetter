class Weather {
  final double? apparentTemperature;
  final double? temperature;
  final double? precipitation;
  final double? latitude;
  final double? longitude;

  Weather(
      {required this.apparentTemperature,
      required this.temperature,
      required this.precipitation,
      required this.latitude,
      required this.longitude});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      apparentTemperature: json['apparent_temperature'],
      temperature: json['temperature_2m'],
      precipitation: json['precipitation'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
