class City {
  final String cityName;
  final double latitude;
  final double longitude;

  City({
    required this.cityName,
    required this.latitude,
    required this.longitude,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityName: json["name"],
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": cityName,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
