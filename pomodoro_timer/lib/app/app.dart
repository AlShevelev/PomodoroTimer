import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/app/routing/routes.dart';
import 'package:pomodoro_timer/features/home/presentation/page.dart';

import '../core/ui_kit/style/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppThemeFactory.defaultTheme(),
        onGenerateRoute: (settings) => Routes.createPageRouteBuilder(settings.name),
        home: const HomePage()
    );
  }
}
