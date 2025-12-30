import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({super.key, required this.startQuiz});

  final VoidCallback startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          height: 300,
          color: const Color.fromARGB(134, 255, 255, 255),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Learn flutter the fun way",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          label: const Text("Start quiz", style: TextStyle(fontSize: 16)),
          icon: const Icon(Icons.arrow_right_alt),
        )
      ],
    );
  }
}
