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
              gradient:
                  LinearGradient(colors: [Colors.white54, Colors.greenAccent])),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text("$count")),
              TextButton(onPressed: setCount, child: const Text("press me :)"))
            ],
          )),
    );
  }
}
