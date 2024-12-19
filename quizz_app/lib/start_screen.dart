import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
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
              style: GoogleFonts.roboto(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
