import 'package:flutter/material.dart';
import 'package:wilmawetter/home/models/city.dart';
import 'package:wilmawetter/home/models/weather.dart';
import 'package:wilmawetter/home/repositories/weather_repository.dart';
import 'package:wilmawetter/home/widgets/citysearchdialog_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Weather>? weatherData;

  final WeatherRepository _weatherRepository = WeatherRepository();

  City? city;

  void clearWeather() {
    setState(() {
      city = null;
      weatherData = null;
    });
  }

  void refreshWeather() {
    setState(() {
      if (city != null) {
        weatherData = _weatherRepository.getWeather(city!);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if (city != null) {
      weatherData = _weatherRepository.getWeather(city!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        title: const Text('Wilma Wetter'),
      ),
      backgroundColor: const Color.fromARGB(255, 213, 213, 213),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 400,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "City/Location:",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        if (city != null)
                          Text(city!.cityName,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 1, 151, 171),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))
                        else
                          const Text(
                            "Wähle eine Stadt",
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 151, 171),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        city = await showDialog<City?>(
                          context: context,
                          builder: (context) => const CitySearchDialog(),
                        );
                        if (city != null) {
                          setState(() {
                            Text("City/Location: ${city!.cityName}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 1, 151, 171),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold));
                          });
                        }
                      },
                      child: const Text(
                        "Stadt Auswählen",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 1, 151, 171),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (weatherData != null)
                FutureBuilder<Weather>(
                  future: weatherData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
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
                            "Apparent: ${snapshot.data!.apparentTemperature}°C",
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
                          if (snapshot.data!.isDay == 1)
                            const Text(
                              'DayTime: Day',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 42, 42, 42),
                                  fontWeight: FontWeight.bold),
                            )
                          else
                            const Text(
                              'DayTime: Night',
                              style: TextStyle(
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
                  refreshWeather();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 151, 171))),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Refresh it Wilma!",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                    SizedBox(width: 10),
                    Icon(
                      Icons.refresh,
                      size: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  clearWeather();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 171, 1, 12))),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Wilma, clear it!",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )),
                    SizedBox(width: 10),
                    Icon(
                      Icons.clear,
                      size: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
