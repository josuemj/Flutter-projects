import 'package:column_app/container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ListView(
        children: const [ListElement(text: "1"), ListElement(text: "2")],
      ),
    ),
  ));
}
