import 'package:flutter/material.dart';

class AppState extends StatefulWidget {
  const AppState({super.key});

  @override
  State<AppState> createState() {
    return _AppState();
  }
}

class _AppState extends State<AppState> {
  var count = 0;

  setCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(136, 80, 60, 136),
            Colors.greenAccent
          ])),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("$count", style: const TextStyle(fontSize: 50)),
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 0, 255, 242),
                          padding: const EdgeInsets.all(16.0),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: setCount,
                        child: const Text("press me :)",
                            style: TextStyle(
                              fontSize: 30,
                            ))),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
