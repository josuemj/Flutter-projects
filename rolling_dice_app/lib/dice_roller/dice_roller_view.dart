import 'package:flutter/material.dart';
import 'dart:math';

class DiceRollerView extends StatelessWidget {
  const DiceRollerView({
    super.key,
    required this.diceValue,
    required this.onRoll,
  });

  final int diceValue;
  final VoidCallback onRoll;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Image.asset(
          'assets/images/dice-$diceValue.png',
          width: 150,
          height: 150,
        ),
        ElevatedButton(
            onPressed: onRoll,
            child: Text(
              'Roll Dice',
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
