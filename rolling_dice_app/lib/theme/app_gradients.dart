import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static const main = RadialGradient(
    colors: [
      AppColors.primary,
      AppColors.secondary,
      AppColors.third,
      AppColors.fourth,
    ],
    radius: 1,
  );
}
