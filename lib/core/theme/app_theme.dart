import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';
import 'app_text_styles.dart';

Color _appColor = Colors.greenAccent;

class AppTheme {
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimensions.kBorderRadius10),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _appColor,
      primary: _appColor,
      brightness: Brightness.dark,
    ),
  );
}
