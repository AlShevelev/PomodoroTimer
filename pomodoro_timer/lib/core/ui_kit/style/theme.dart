
import 'package:flutter/material.dart';

import 'typography.dart';
import 'colors.dart';

class AppThemeFactory {
  static ThemeData defaultTheme() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.lightBrown,
        onPrimary: AppColors.black,
        secondary: AppColors.lightBrown,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        background: AppColors.lightBrown,
        onBackground: AppColors.black,
        surface: AppColors.white,
        onSurface: AppColors.black
      ),

      scaffoldBackgroundColor: AppColors.lightBrown,

      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBrown,
          shadowColor: AppColors.lightBrown,
          elevation: 0,
          centerTitle: true
      ),

      textTheme: const TextTheme(
        headline1: AppTypography.s36w600,
        headline2: AppTypography.s32w600,
        headline3: AppTypography.s24w600,

        subtitle1: AppTypography.s20w600,
        subtitle2: AppTypography.s20w400,

        bodyText1: AppTypography.s14w600,
        bodyText2: AppTypography.s14w400,
      )
    );
  }
}