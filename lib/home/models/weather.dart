class Weather {
  final String city;
  final double feelsLike;
  final double temperature;
  final double niederschlag;
  final bool dayTime;
  final double latitude;
  final double longitude;

  Weather(
      {required this.city,
      required this.feelsLike,
      required this.temperature,
      required this.niederschlag,
      required this.dayTime,
      required this.latitude,
      required this.longitude});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      feelsLike: json['apparent_temperature'],
      temperature: json['temperature_2m'],
      niederschlag: json['precipitation'],
      dayTime: json['is_day'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'apparent_temperature': feelsLike,
      'temperature_2m': temperature,
      'precipitation': niederschlag,
      'is_day': dayTime,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
