import 'package:flutter/material.dart';
import 'dart:math';

class DiceRollerView extends StatefulWidget {
  const DiceRollerView({
    super.key,
    required this.diceValue,
    required this.onRoll,
  });

  final int diceValue;
  final void Function() onRoll;

  @override
  State<DiceRollerView> createState() => _DiceRollerViewState();
}

class _DiceRollerViewState extends State<DiceRollerView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _rotationAnimation,
          child: Image.asset(
            'assets/images/dice-${widget.diceValue}.png',
            width: 150,
            height: 150,
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: child,
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _animationController.forward(from: 0).then((_) {
              widget.onRoll();
            });
          },
          child: const Text(
            'Roll Dice',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
