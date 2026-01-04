import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'questions_summary.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({
    super.key,
    required this.results,
    required this.restartQuiz,
  });

  final List<String> results;
  final VoidCallback restartQuiz;

  int getCorectAnserts() {
    int correctCount = 0;
    for (int i = 0; i < results.length; i++) {
      if (results[i] == questions[i].answers[0]) {
        correctCount++;
      }
    }
    return correctCount;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered ${getCorectAnserts()} out of ${questions.length} questions correctly!",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(answers: results),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: restartQuiz,
                child: const Text('Restart Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
