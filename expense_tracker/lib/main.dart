import 'package:expense_tracker/expense_app.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
void main() {
  runApp(
    MaterialApp(
      home: ExpenseApp(),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimary,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
      ),
    ),
  );
}
