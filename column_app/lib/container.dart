import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  const ListElement({required this.text, super.key});

  final String text;
  @override
  Widget build(context) {
    return Container(
        height: 40,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.amber, Colors.blueAccent])),
        child: Center(
          child: Text(text),
        ));
  }
}
