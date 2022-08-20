import 'package:flutter/material.dart';
import 'slide_left_route.dart';
import '../../features/explanation/presentation/explanation_page.dart';
import '../../features/settings/presentation/settings_page.dart';

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