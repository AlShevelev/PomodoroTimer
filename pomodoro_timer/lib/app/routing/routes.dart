import 'package:flutter/material.dart';
import 'package:pomodoro_timer/app/routing/slide_left_route.dart';
import 'package:pomodoro_timer/features/explanation/presentation/page.dart';
import 'package:pomodoro_timer/features/settings/presentation/page.dart';

class Routes {
  static const homePage = '/';
  static const settingsPage = '/settings';
  static const explanationPage = '/explanation';

  static PageRouteBuilder? createPageRouteBuilder(String? name) {
    switch(name) {
      case settingsPage: return SlideLeftRoute(const SettingsPage());
      case explanationPage: return SlideLeftRoute(const ExplanationPage());
      default: return null;
    }
  }
}