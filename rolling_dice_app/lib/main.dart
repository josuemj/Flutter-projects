import 'package:flutter/material.dart';

void main() {
  const List<Color> colors = [
    Color.fromARGB(255, 48, 0, 45),
    Color.fromRGBO(79, 0, 107, 1),
    Color.fromARGB(255, 110, 5, 110),
    Color.fromARGB(255, 81, 5, 88),
  ];

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: colors, radius: 1),
          ),
          child: Center(
            child: Text("Hello, world!"),
          ),
        ),
      ),
    ),
  );
}
