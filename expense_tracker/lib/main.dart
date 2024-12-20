import 'package:expense_tracker/expense_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ExpenseApp(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    ),
  );
}
