class Weather {
  final double apparentTemperature;
  final double temperature;
  final double precipitation;
  final double latitude;
  final double longitude;
  final int isDay;

  Weather(
      {required this.apparentTemperature,
      required this.temperature,
      required this.precipitation,
      required this.latitude,
      required this.longitude,
      required this.isDay});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      apparentTemperature: json['current']["apparent_temperature"],
      temperature: json['current']["temperature_2m"],
      precipitation: json['current']['precipitation'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isDay: json['current']['is_day'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'current': {
        'apparent_temperature': apparentTemperature,
        'temperature_2m': temperature,
        'precipitation': precipitation,
        'is_day': isDay
      },
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
