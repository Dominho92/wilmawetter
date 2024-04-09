import 'package:flutter/material.dart';
import 'package:wilmawetter/home/models/weather.dart';
import 'package:wilmawetter/home/repositories/weather_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<Weather> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherRepository().getWeather();
  }

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
              FutureBuilder<Weather>(
                future: weatherData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          'Temperature: ${snapshot.data!.temperature}°C',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Feels like: ${snapshot.data!.apparentTemperature}°C',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Precipitation: ${snapshot.data!.precipitation} mm',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Latitude: ${snapshot.data!.latitude}',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Longitude: ${snapshot.data!.longitude}',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    WeatherRepository().getWeather();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 151, 171))),
                child: const Text("Refresh",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
