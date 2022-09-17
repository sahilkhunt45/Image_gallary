import 'package:flutter/material.dart';
import 'package:photo_slider/homepage.dart';
import 'package:photo_slider/slider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'slider': (context) => const Photo_slider(),
      },
    ),
  );
}
