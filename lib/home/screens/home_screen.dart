import 'package:flutter/material.dart';
import 'package:wilmawetter/home/models/city.dart';
import 'package:wilmawetter/home/models/weather.dart';
import 'package:wilmawetter/home/repositories/city_repository.dart';
import 'package:wilmawetter/home/repositories/weather_repository.dart';
import 'package:wilmawetter/home/widgets/showcity_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Weather> weatherData;
  late Future<City> cityData;

  TextEditingController cityController = TextEditingController();

  List<String> selectedCities = [];

  final WeatherRepository _weatherRepository = WeatherRepository();
  final CityRepository _cityRepository = CityRepository();

  City? city;

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  void refreshWeather() {
    setState(() {
      weatherData = _weatherRepository.getWeather();
    });
  }

  @override
  void initState() {
    super.initState();
    weatherData = WeatherRepository().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      if (cityController.text.isNotEmpty)
                        Text(cityController.text,
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Welche Stadt soll es sein?",
                              style: TextStyle(fontSize: 19)),
                          content: TextField(
                            onTapOutside: (PointerDownEvent event) {
                              FocusScope.of(context).unfocus();
                            },
                            controller: cityController,
                            decoration: const InputDecoration(
                                hintText: "Stadt eingeben"),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  final city = _cityRepository
                                      .getCity(cityController.text);
                                  setState(() {
                                    Navigator.of(context).pop(city);
                                  });
                                },
                                child: const Text("Add")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Close")),
                          ],
                        ),
                      );
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
              child: const Text("Refresh it Wilma!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
