import 'dart:math';

import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  ButtonsScreen({super.key});

  final elvatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 186, 249, 184),
    foregroundColor: const Color.fromARGB(255, 61, 161, 128),
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
  );

  final outlineButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 78, 161, 75),
    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    side: const BorderSide(
      color: Color.fromARGB(255, 129, 184, 142),
      width: 5.0,
    ),
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
    ),
  );

  @override
  Widget build(context) {
    return Center(
      child: (Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(20), //The Box model :)
            child: ElevatedButton(
              onPressed: () {},
              style: elvatedButtonStyle,
              child: const Text(
                "Elevated Button",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20), //The Box model :)
            child: OutlinedButton(
              style: outlineButtonStyle,
              onPressed: () {},
              child: const Text(
                "Outlined Button",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20), //The Box model :)
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Text Button",
              ),
            ),
          )
        ],
      )),
    );
  }
}
