import 'package:flutter/material.dart';
import 'package:quizz_app/question/question_view.dart';
import '../data/questions.dart';
import '../models/quiz_question.dart';
import '../question/question_screen.dart';
import '../rcesults/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  List<String> selectedAnswers = [];
  late Widget currentScreen;

  @override
  initState() {
    super.initState();
    currentScreen = QuestionScreen(
      selectAnswer: selectAnswer,
    );
  }

  /*purpose is to go next question and store the selected answer*/
  selectAnswer(String answer) {
    selectedAnswers.add(answer);
    setState(() {
      if (selectedAnswers.length == questions.length) {
        print("quiz ended");

        currentScreen = ResultsScreen(
          results: selectedAnswers,
        );

        selectedAnswers = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentScreen;
  }
}
