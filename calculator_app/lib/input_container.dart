import 'package:calculator_app/model/calculator.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
    required this.onTap,
  });

  final void Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: GridView.count(
          // Number of buttons in each row
          crossAxisCount: 4,

          // Spacing between buttons horizontally
          crossAxisSpacing: 5,

          // Spacing between buttons vertically
          mainAxisSpacing: 5,

          children: [
            ...calcExpressions.map(
              (item) => Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  key: ValueKey(item),
                  onPressed: () {
                    onTap(item);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
