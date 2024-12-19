import 'package:flutter/material.dart';
import 'package:rolling_dice_app/app_colors.dart';
import 'package:rolling_dice_app/screens/main_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: AppContainer(
        gradientColors: AppColors.appContainer,
      ),
    ),
  );
}
