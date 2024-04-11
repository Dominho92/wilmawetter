import 'package:flutter/material.dart';
import 'package:wilmawetter/home/models/city.dart';

class ShowCityWidget extends StatefulWidget {
  const ShowCityWidget({super.key, required City city});

  @override
  State<ShowCityWidget> createState() => _ShowCityWidgetState();
}

class _ShowCityWidgetState extends State<ShowCityWidget> {
  TextEditingController cityController = TextEditingController();

  List<String> selectedCities = [];

  showTheCity() {
    return selectedCities.map((city) {
      return Text(city,
          style: const TextStyle(
              color: Color.fromARGB(255, 1, 151, 171),
              fontSize: 16,
              fontWeight: FontWeight.bold));
    }).toList();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              if (selectedCities.isEmpty)
                const Text(
                  "Wähle eine Stadt",
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 151, 171),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (selectedCities.isNotEmpty)
                Column(
                  children: [
                    Row(
                      children: showTheCity(),
                    ),
                  ],
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
                    decoration:
                        const InputDecoration(hintText: "Stadt eingeben"),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCities.clear();
                            selectedCities.add(cityController.text);
                            cityController.clear();
                            Navigator.of(context).pop();
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
    );
  }
}
