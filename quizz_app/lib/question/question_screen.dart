import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/question/question_view.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectAnswer});

  final void Function(String answer) selectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  nextQuestion(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return QuestionView(
      question: questions[currentQuestionIndex],
      nextQuestion: nextQuestion,
    );
  }
}
