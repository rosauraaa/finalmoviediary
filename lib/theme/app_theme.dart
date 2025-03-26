import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.black, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.black, fontSize: 16),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(color: AppColors.black, fontSize: 20),
    ),
  );
}
