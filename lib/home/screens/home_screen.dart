import 'package:flutter/material.dart';
import 'package:wilmawetter/home/repositories/weather_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherRepository weatherData = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: const Text('Wilma Wetter'),
        ),
        backgroundColor: const Color.fromARGB(255, 213, 213, 213),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "City/Location: Stuttgart",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 1, 151, 171),
                    fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                future: weatherData.fetchWeather(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          "Temperature: ${snapshot.data?.temperature}°C",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 151, 171),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Feels Like: ${snapshot.data?.feelsLike}°C",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 151, 171),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Precipitation: ${snapshot.data?.niederschlag}mm",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 151, 171),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Day Time: ${snapshot.data?.dayTime}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 1, 151, 171),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
