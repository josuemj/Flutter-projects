import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/widgets/old/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.reTakeQuiz,
    required this.selectedAnswers,
  });
  final void Function() reTakeQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // var list = [for (var i = 0; i < selectedAnswers.length; i++) i];

    final summaryData = getSummary();
    final numTotalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 24,
                color: Colors.white,
              ),
              'Your answered $correctQuestions out of $numTotalQuestions answers correcly',
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 45, 255, 220)),
                icon: Icon(
                  Icons.restart_alt,
                  color: const Color.fromARGB(255, 31, 173, 255),
                  size: 20,
                ),
                onPressed: reTakeQuiz,
                label: Text(
                  "Restar Quiz!",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
