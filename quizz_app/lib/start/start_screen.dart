import 'package:flutter/material.dart';
import 'start_view.dart';
import '../quiz/quiz_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  late Widget activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartView(
      startQuiz: () {
        startQuiz();
      },
    );
  }

  void startQuiz() {
    setState(() {
      activeScreen = QuizScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 45, 0, 96),
                Color.fromARGB(255, 38, 13, 54),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            switchInCurve: Curves.easeOutBack,
            switchOutCurve: Curves.easeInBack,
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
                child: ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                ),
              );
            },
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
