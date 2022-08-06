import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/app/routing/routes.dart';
import 'package:pomodoro_timer/core/ui_kit/page_background.dart';
import 'package:pomodoro_timer/features/explanation/presentation/page.dart';
import 'package:pomodoro_timer/features/settings/presentation/page.dart';

import '../../../app/routing/slide_left_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.homePageTitle),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.settingsPage);
              },
            ),
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.explanationPage);
              },
            ),
          ],
        ),
        body: CustomPaint(
          painter: PageBackground(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Main page',
                ),
              ],
            ),
          ),
        ));
  }
}
