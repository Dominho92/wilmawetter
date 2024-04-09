import 'package:flutter/material.dart';
import 'package:wilmawetter/home/repositories/weather_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherRepository weatherRepository = WeatherRepository();

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
                "City/Location:",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 1, 151, 171),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Feels Like Temperature:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Acutally Temperature:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Niederschlag:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "DayTime:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Location Latitude:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 1, 151, 171)),
                ),
                onPressed: () {
                  weatherRepository.fetchWeather();
                },
                child: const Text(
                  "Refresh",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
