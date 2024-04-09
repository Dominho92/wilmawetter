class Weather {
  final String city;
  final double feelsLike;
  final double temperature;
  final double niederschlag;
  final int dayTime;
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
      city: json['cityName'],
      feelsLike: json['feelsLike'],
      temperature: json['temperature'],
      niederschlag: json['niederschlag'],
      dayTime: json['dayTime'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': city,
      'feelsLike': feelsLike,
      'temperature': temperature,
      'niederschlag': niederschlag,
      'dayTime': dayTime,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
