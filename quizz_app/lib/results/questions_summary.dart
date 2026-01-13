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
    return ListView.builder(
      itemCount: answers.length,
      itemBuilder: (context, index) {
        final answer = answers[index];
        final question = questions[index];
        final isCorrect = answer == question.answers[0];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isCorrect
                      ? const LinearGradient(
                          colors: [Colors.green, Colors.lightGreen],
                        )
                      : const LinearGradient(
                          colors: [Colors.red, Colors.orange],
                        ),
                  border: Border.all(
                    color: isCorrect ? Colors.green : Colors.red,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      answer,
                      style: TextStyle(
                          color: isCorrect ? Colors.white70 : Colors.redAccent,
                          fontSize: 16,
                          decoration: isCorrect
                              ? TextDecoration.none
                              : TextDecoration.lineThrough,
                          decorationThickness: 2),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      question.answers[0],
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
