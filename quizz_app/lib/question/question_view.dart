import 'package:flutter/widgets.dart';
import 'package:quizz_app/models/quiz_question.dart';
import '../widgets/answer_button.dart';

class QuestionView extends StatelessWidget {
  const QuestionView(
      {super.key, required this.question, required this.nextQuestion});

  final QuizQuestion question;
  final void Function(String answer) nextQuestion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: question.answers.map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      nextQuestion(answer);
                    });
              }).toList()),
        ));
  }
}
