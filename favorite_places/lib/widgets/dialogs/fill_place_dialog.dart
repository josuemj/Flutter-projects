import 'package:flutter/material.dart';

class FillPlaceDialog extends StatelessWidget {
  const FillPlaceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Fill place',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'understood',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
