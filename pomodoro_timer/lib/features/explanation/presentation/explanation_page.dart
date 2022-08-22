import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sprintf/sprintf.dart';

import '../../../core/bloc/bloc_provider.dart';
import '../../../core/ui_kit/page_background.dart';
import '../domain/model/settings.dart';
import 'explanation_block.dart';
import 'ui/curved_bracket.dart';
import 'ui/one_line.dart';
import 'ui/vertical_arrow.dart';
import '../../../core/ui_kit/app_bar_back.dart';

class ExplanationPage extends StatefulWidget {
  const ExplanationPage({Key? key}) : super(key: key);

  @override
  State<ExplanationPage> createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  final ExplanationBloc _bloc = ExplanationBloc();

  @override
  void initState() {
    _bloc.loadSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: Scaffold(
        appBar: AppBarBack(
          title: Text(AppLocalizations.of(context)!.explanationPageTitle),
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: CustomPaint(
          painter: PageBackground(),
          child: StreamBuilder<Settings>(
              stream: _bloc.settings,
              builder: (context, snapshot) {
                return Column(
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
                                  text: sprintf(
                                    AppLocalizations.of(context)!.explanationLine2,
                                    [snapshot.data!.pomodoroDuration],
                                  ),
                                  topPadding: 10.0,
                                  bottomPadding: 20.0,
                                ),
                                OneLine(
                                  text: AppLocalizations.of(context)!.explanationLine3,
                                  topPadding: 10.0,
                                  bottomPadding: 20.0,
                                ),
                                OneLine(
                                  text: sprintf(
                                    AppLocalizations.of(context)!.explanationLine4,
                                    [snapshot.data!.shortBreakDuration],
                                  ),
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
                                  text: sprintf(
                                    AppLocalizations.of(context)!.explanationLine5,
                                    [snapshot.data!.pomodoroInSeries],
                                  ),
                                  topPadding: 10.0,
                                  bottomPadding: 20.0,
                                ),
                                OneLine(
                                  text: sprintf(
                                    AppLocalizations.of(context)!.explanationLine6,
                                    [snapshot.data!.longBreakDuration],
                                  ),
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
                );
              }),
        ),
      ),
    );
  }
}
