import 'package:flutter/material.dart';
import 'dart:math';

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
            child: DiceRoller(),
          ),
        ),
      ),
    ),
  );
}

class DiceRoller extends StatefulWidget {
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
