class Weather {
  final String cityName;
  final double feelsLike;
  final double temperature;
  final double niederschlag;
  final int dayTime;
  final double latitude;

  Weather(
      {required this.cityName,
      required this.feelsLike,
      required this.temperature,
      required this.niederschlag,
      required this.dayTime,
      required this.latitude});
}
