import 'package:flutter/material.dart';

abstract class AppColors {
  // ===== Core neutrals =====
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color whiteColor70 = Colors.white70;

  // ===== Brand colors (APKSCAN Tech Dark) =====
  static const Color primary = Color(0xFF00FF41);
  static const Color primaryDark = Color(0xFF00C832);
  static const Color textHint = Color(0xFF666666);

  // ===== Status colors =====
  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;
  static const Color greyColor = Colors.grey;
  static const Color fillColor = Color(0xFF151515);
  // ===== Dark mode variants =====
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkBorder = Color(0xFF222C24);
}

extension AppColorsExtension on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  Color get backgroundColor =>
      _isDark ? AppColors.darkBackground : const Color(0xFFFBF7F2);

  Color get surfaceColor =>
      _isDark ? AppColors.darkSurface : AppColors.whiteColor;

  Color get primaryTextColor =>
      _isDark ? AppColors.whiteColor : const Color(0xFF2B2622);

  Color get secondaryTextColor =>
      _isDark ? AppColors.textHint : const Color(0xFF6B6258);

  Color get primaryColor => _isDark ? AppColors.primary : AppColors.primaryDark;

  Color get borderColor => AppColors.textHint;
}
