import 'package:flutter/material.dart';
import 'package:quizz_app/screens/questions _screen.dart';
import 'package:quizz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen =
        StartScreen(switchScreen); //liftring up state by passing func
    super.initState();
  }

  switchScreen() {
    //Rendering conditionally
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 94, 31, 196),
                Color.fromARGB(255, 72, 30, 107)
              ],
            ),
          ),
          child: activeScreen, //Setting state
        ),
      ),
    );
  }
}
