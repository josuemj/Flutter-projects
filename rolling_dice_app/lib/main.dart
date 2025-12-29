import 'package:flutter/material.dart';
import 'theme/app_gradients.dart';
import 'dart:math';

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

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _currentDiceRoll = 1;

  void _rollDice() {
    final random = Random();
    int number = random.nextInt(6) + 1;

    setState(() {
      _currentDiceRoll = number;
      print('Dice rolled to $_currentDiceRoll');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/dice-$_currentDiceRoll.png',
            width: 200, height: 200),
        ElevatedButton(
          onPressed: _rollDice,
          child: Text('Roll Dice'),
        ),
      ],
    );
  }
}
