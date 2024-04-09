import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wilma Wetter'),
        ),
        backgroundColor: Color.fromARGB(255, 213, 213, 213),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "City/Location:",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 1, 151, 171),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Feels Like Temperature:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Acutally Temperature:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Niederschlag:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "DayTime:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Location Latitude:",
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 45, 45, 45),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
