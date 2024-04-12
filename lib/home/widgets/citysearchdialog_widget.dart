import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wilmawetter/home/repositories/city_repository.dart';

class CitySearchDialog extends StatefulWidget {
  const CitySearchDialog({super.key});

  @override
  State<CitySearchDialog> createState() => _CitySearchDialogState();
}

class _CitySearchDialogState extends State<CitySearchDialog> {
  TextEditingController cityController = TextEditingController();

  final CityRepository _cityRepository = CityRepository();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Welche Stadt soll es sein?",
          style: TextStyle(fontSize: 19)),
      content: TextField(
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).unfocus();
        },
        controller: cityController,
        decoration: const InputDecoration(hintText: "Stadt eingeben"),
      ),
      actions: [
        TextButton(
            onPressed: () async {
              final response =
                  await _cityRepository.getCity(cityController.text);
              if (!context.mounted) return;
              Navigator.of(context).pop(response);
            },
            child: const Text("Add")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close")),
      ],
    );
  }
}