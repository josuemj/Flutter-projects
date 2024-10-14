import 'package:flutter/material.dart';

class CounterState extends StatefulWidget {
  const CounterState({super.key});

  @override
  State<CounterState> createState() {
    return _CounterSatate();
  }
}

class _CounterSatate extends State<CounterState> {
  var count = 0;

  setCount() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: (Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$count'),
          TextButton(
            onPressed: setCount,
            child: const Text('+'),
          )
        ],
      )),
    );
  }
}
