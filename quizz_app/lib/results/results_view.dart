import 'package:flutter/material.dart';

class ResultsView extends StatelessWidget {
  const ResultsView(
      {super.key, required this.results, required this.restartQuiz});

  final List<String> results;
  final VoidCallback restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: restartQuiz,
              child: const Text('Restart Quiz'),
            ),
          ),
        ],
      ),
    );
  }
}
