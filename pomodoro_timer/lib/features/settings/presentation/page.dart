import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/core/ui_kit/page_background.dart';

import '../../../core/ui_kit/app_bar_back.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(
          title: Text(AppLocalizations.of(context)!.settingsPageTitle),
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: CustomPaint(
          painter: PageBackground(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Settings page',
                ),
              ],
            ),
          ),
        )
    );
  }
}
