import 'package:calculator_app/input_container.dart';
import 'package:calculator_app/operation_container.dart';
import 'package:flutter/material.dart';
import 'package:dart_eval/dart_eval.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  var expression = '';

  void press(String value) {
    setState(() {
      if (value == '=') {
        try {
          var result = eval(expression).toString();
          expression = result;
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Invalid  Input'),
              content:
                  const Text('Please make sure that the expression is valid'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            ),
          );
          expression = '';
        }
      } else {
        expression = expression + value;
      }
      if (value == 'C') {
        expression = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(62, 249, 211, 255),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OperationContainer(expression: expression),
            InputContainer(
              onTap: press,
            )
          ],
        ));
  }
}
