import 'package:flutter/material.dart';

import '../const/colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: ThemeData().colorScheme.copyWith(
      primary: const Color(0xFFF2F2F2),
      surfaceTint: const Color(0xFFF2F2F2),
    ),
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.mainAccent.withOpacity(0.25),
        cursorColor: AppColors.mainAccent),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.mainAccent.withOpacity(0.1),
      hintStyle: const TextStyle(color: Color(0xFF474D4C)),
      prefixIconColor: const Color(0xFF474D4C),
      focusColor: const Color(0xFF474D4C),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFFC8C8C8))),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.mainAccent,
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFFFC4445),
          )),
    ),
    useMaterial3: true,
    primaryColor: AppColors.mainAccent,
    fontFamily: 'Inter',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Color(0xFF091312),
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 26,
        color: Color(0xFF091312),
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Color(0xFF5B5B5B),
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color(0xFF091312),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF959595),
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
