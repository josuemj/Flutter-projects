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
    // Only update state if there are more questions, otherwise parent handles switch
    if (mounted && currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeOutExpo,
      switchOutCurve: Curves.easeInExpo,
      transitionBuilder: (child, animation) {
        final isEntering =
            (child.key as ValueKey<int>).value == currentQuestionIndex;

        if (isEntering) {
          // Entrance Animation: Zoom in from small, slight rotation settle
          // Animation goes 0 -> 1
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.elasticOut),
              ),
              child: child,
            ),
          );
        } else {
          // Exit Animation: Explode out (Scale up + Fade out)
          // Animation goes 1 -> 0 (Reverse)
          // We map 1 -> 1.0, 0 -> 2.5 (or higher)
          // Note: Flutter drives reverse animation from 1.0 to 0.0
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeIn),
            ),
            child: ScaleTransition(
              scale: Tween<double>(begin: 2.5, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeIn),
              ),
              child: child,
            ),
          );
        }
      },
      // Better Explosion:
      // We want the OLD one to scale UP (1 -> 5) and Fade Out.
      // We want the NEW one to scale UP (0 -> 1) and Fade In.
      // Standard ScaleTransition goes 0 -> 1.
      // So for the EXITING widget, reverse animation goes 1 -> 0.
      // We want Exiting to go 1 -> big.
      // This requires a custom Transition wrapper or carefully tuned Tween.
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: Container(
        key: ValueKey(currentQuestionIndex),
        child: QuestionView(
          question: questions[currentQuestionIndex],
          nextQuestion: nextQuestion,
        ),
      ),
    );
  }
}
