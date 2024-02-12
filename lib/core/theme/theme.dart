import 'package:flutter/material.dart';

import '../const/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    useMaterial3: true,
    primaryColor: AppColors.mainAccent,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xFF091312),
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFF091312),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF091312),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Color(0xFF091312),
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFAFAFA),
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Color(0xFFFAFAFA),
      ),
    ),
  );
}
