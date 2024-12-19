import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //rendering content conditionally
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String asnwer) {
    selectedAnswers.add(asnwer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void reTakeQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 75, 27, 103),
                Color.fromARGB(255, 111, 28, 183)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: activeScreen == 'start-screen' // condition
              ? StartScreen(switchScreen) // true
              : (activeScreen == 'questions-screen')
                  ? QuestionsScreen(onSelectedAnswer: chooseAnswer)
                  : ResultsScreen(
                      reTakeQuiz: reTakeQuiz,
                      selectedAnswers: selectedAnswers,
                    ), //
        ),
      ),
    );
  }
}
