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

class _DiceRollerViewState extends State<DiceRollerView> with TickerProviderStateMixin {
  late final AnimationController _rotationAnimationController;
  late final Animation<double> _rotationAnimation;

  late final AnimationController _pulseAnimationController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(_rotationAnimationController);

    _pulseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _pulseAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _rotationAnimationController.dispose();
    _pulseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return ScaleTransition(
              scale: _pulseAnimation,
              child: AnimatedBuilder(
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
            );
          },
        ),
        const SizedBox(height: 20),
        ScaleTransition(
          scale: _pulseAnimation,
          child: ElevatedButton(
            onPressed: () {
              _rotationAnimationController.forward(from: 0).then((_) {
                widget.onRoll();
              });
            },
            child: const Text(
              'Roll Dice',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
