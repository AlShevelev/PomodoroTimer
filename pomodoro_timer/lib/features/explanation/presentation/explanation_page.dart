import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_timer/core/ui_kit/page_background.dart';
import 'package:pomodoro_timer/features/explanation/presentation/ui/curved_bracket.dart';
import 'package:pomodoro_timer/features/explanation/presentation/ui/one_line.dart';
import 'package:pomodoro_timer/features/explanation/presentation/ui/vertical_arrow.dart';

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
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomPaint(
                      painter: VerticalArrow(),
                      child: Container(),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        OneLine(
                          text: AppLocalizations.of(context)!.explanationLine1,
                          topPadding: 10.0,
                          bottomPadding: 20.0,
                        ),
                        OneLine(
                          text: AppLocalizations.of(context)!.explanationLine2,
                          topPadding: 10.0,
                          bottomPadding: 20.0,
                        ),
                        OneLine(
                          text: AppLocalizations.of(context)!.explanationLine3,
                          topPadding: 10.0,
                          bottomPadding: 20.0,
                        ),
                        OneLine(
                          text: AppLocalizations.of(context)!.explanationLine4,
                          topPadding: 10.0,
                          bottomPadding: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: CustomPaint(
                            painter: CurvedBracket(),
                            child: Container(
                              height: 40.0,
                            ),
                          ),
                        ),
                        OneLine(
                          text: AppLocalizations.of(context)!.explanationLine5,
                          topPadding: 10.0,
                          bottomPadding: 20.0,
                        ),
                        OneLine(
                          text: AppLocalizations.of(context)!.explanationLine6,
                          topPadding: 10.0,
                          bottomPadding: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
