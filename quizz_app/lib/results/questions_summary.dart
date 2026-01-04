import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.answers,
  });

  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...answers.map((answer) => Row(
              children: [
                Text(
                  answers.indexOf(answer).toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        answer == questions[answers.indexOf(answer)].answers[0]
                            ? Color.fromARGB(255, 0, 255, 0)
                            : Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
                Column(
                  children: [
                    Text(questions[answers.indexOf(answer)].text,
                        style: TextStyle(color: Colors.white)),
                    Text(
                      answer,
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      questions[answers.indexOf(answer)].answers[0],
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  ],
                )
              ],
            )),
      ],
    );
  }
}
