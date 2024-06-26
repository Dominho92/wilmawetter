import 'package:flutter/material.dart';

const myCustomBG = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/images/bg.png"),
    fit: BoxFit.cover,
  ),
);

const cityTextStyle = TextStyle(
    color: Color.fromARGB(255, 1, 151, 171),
    fontSize: 16,
    fontWeight: FontWeight.bold);
