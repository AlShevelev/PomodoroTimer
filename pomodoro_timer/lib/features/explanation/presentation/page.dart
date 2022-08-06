import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/core/ui_kit/page_background.dart';

import '../../../core/ui_kit/app_bar_back.dart';

class ExplanationPage extends StatefulWidget {
  const ExplanationPage({Key? key}) : super(key: key);

  @override
  State<ExplanationPage> createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(
          title: Text(AppLocalizations.of(context)!.explanationPageTitle),
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
                  'Explanation page',
                ),
              ],
            ),
          ),
        )
    );
  }
}
