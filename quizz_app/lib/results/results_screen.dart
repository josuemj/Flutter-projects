import 'package:flutter/material.dart';
import '../start/start_screen.dart';
import '../results/results_view.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.results,
  });

  final List<String> results;

  @override
  State<ResultsScreen> createState() {
    return _ResultsScreenState();
  }
}

class _ResultsScreenState extends State<ResultsScreen> {
  late Widget activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen =
        ResultsView(results: widget.results, restartQuiz: restartQuiz);
  }

  restartQuiz() {
    setState(() {
      activeScreen = const StartScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return activeScreen;
  }
}
