import 'package:flutter/material.dart';

import '../utils/utils.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    ),
  );
}
