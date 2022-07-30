
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/presentation/ui_kit/style/colors.dart';
import 'package:pomodoro_timer/presentation/ui_kit/style/typography.dart';

class AppThemeFactory {
  static ThemeData defaultTheme() {
    return ThemeData(
      backgroundColor: AppColors.lightBrown,

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