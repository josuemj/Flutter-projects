import 'package:flutter/material.dart';
import 'dice_roller_view.dart';
import 'dart:math';
import '../theme/app_gradients.dart';

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({super.key});

  @override
  _DiceRollerScreenState createState() => _DiceRollerScreenState();
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  final random = Random();
  int diceValue = Random().nextInt(6) + 1;

  void onRoll() {
    setState(() {
      diceValue = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.main,
        ),
        child: Center(
          child: DiceRollerView(
            diceValue: diceValue,
            onRoll: onRoll,
          ),
        ),
      ),
    );
  }
}
