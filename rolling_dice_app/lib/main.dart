import 'package:flutter/material.dart';
import 'theme/app_gradients.dart';
import 'dice_roller/dice_roller.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.main,
          ),
          child: Center(
            child: DiceRoller(),
          ),
        ),
      ),
    ),
  );
}
