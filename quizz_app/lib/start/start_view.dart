import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({super.key, required this.startQuiz});

  final VoidCallback startQuiz;

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _contentSlideAnimation;
  late Animation<double> _contentOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _contentOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScaleTransition(
          scale: _logoScaleAnimation,
          child: FadeTransition(
            opacity: _logoOpacityAnimation,
            child: Image.asset(
              "assets/images/quiz-logo.png",
              width: 300,
              height: 300,
              color: const Color.fromARGB(134, 255, 255, 255),
            ),
          ),
        ),
        SlideTransition(
          position: _contentSlideAnimation,
          child: FadeTransition(
            opacity: _contentOpacityAnimation,
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      "Learn flutter the fun way",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: widget.startQuiz,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  label: const Text("Start quiz"),
                  icon: const Icon(Icons.arrow_right_alt),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
