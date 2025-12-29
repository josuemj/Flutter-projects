import 'package:flutter/material.dart';
import 'theme/app_gradients.dart';
import 'dice_roller/dice_roller_view.dart';
import 'dice_roller/dice_roller_screen.dart';

void main() {
  runApp(const DiceRollerApp());
}

class DiceRollerApp extends StatelessWidget {
  const DiceRollerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceRollerScreen(),
    );
  }
}
