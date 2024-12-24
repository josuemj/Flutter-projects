import 'package:flutter/material.dart';

class OperationContainer extends StatelessWidget {
  const OperationContainer({super.key, required this.expression});

  final String expression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(80, 135, 124, 1),
              Color.fromRGBO(54, 178, 153, 1),
              Color.fromRGBO(62, 249, 211, 1),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomRight,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            expression,
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
