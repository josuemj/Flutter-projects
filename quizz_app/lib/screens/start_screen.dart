import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    // receiving method
    super.key,
  });

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 94, 31, 196),
            Color.fromARGB(255, 72, 30, 107)
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(
                bottom: 30,
              ),
              child: Image.asset(
                'assets/images/quiz-logo.png',
                width: 325,
                height: 325,
                color: const Color.fromARGB(61, 255, 255, 255),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: Text(
                'Leann  flutter fun way!',
                style: GoogleFonts.lato(
                    fontSize: 24,
                    color: const Color.fromARGB(255, 211, 157, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
            // ignore: prefer_const_constructors
            OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: startQuiz,
              label: const Text(
                "Start quiz",
              ),
            )
          ],
        ),
      ),
    );
  }
}
