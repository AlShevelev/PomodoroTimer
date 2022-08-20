
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ui/checkbox_with_text.dart';
import '../../../core/ui_kit/page_background.dart';
import '../domain/model/settings.dart';
import '../domain/settings_bloc.dart';
import 'ui/left_right_value_selector.dart';

import '../../../core/bloc/bloc_provider.dart';
import '../../../core/ui_kit/app_bar_back.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsBloc _bloc = SettingsBloc();

  @override
  void initState() {
    _bloc.loadSettings();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
      child: Scaffold(
          appBar: AppBarBack(
            title: Text(AppLocalizations.of(context)!.settingsPageTitle),
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          body: CustomPaint(
            painter: PageBackground(),
            child: StreamBuilder<Settings>(
              stream: _bloc.settings,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: LeftRightValueSelector(
                          text: AppLocalizations.of(context)!.settingsPomodoro,
                          value: snapshot.data?.pomodoroDuration ?? 0,
                          onValueChanged: (value) {
                            _bloc.setPomodoroDuration(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: LeftRightValueSelector(
                          text: AppLocalizations.of(context)!.settingsShortBreak,
                          value: snapshot.data?.shortBreakDuration ?? 0,
                          onValueChanged: (value) {
                            _bloc.setShortBreakDuration(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: LeftRightValueSelector(
                          text: AppLocalizations.of(context)!.settingsLongBreak,
                          value: snapshot.data?.longBreakDuration ?? 0,
                          onValueChanged: (value) {
                            _bloc.setLongBreakDuration(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: LeftRightValueSelector(
                          text: AppLocalizations.of(context)!.settingsPomodorosUntil,
                          value: snapshot.data?.pomodoroInSeries ?? 0,
                          onValueChanged: (value) {
                            _bloc.setPomodoroInSeries(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: LeftRightValueSelector(
                          text: AppLocalizations.of(context)!.settingsPomodorosTotal,
                          value: snapshot.data?.pomodoroTotal ?? 0,
                          onValueChanged: (value) {
                            _bloc.setPomodoroTotal(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CheckboxWithText(
                          text: AppLocalizations.of(context)!.settingsAutostartBreaks,
                          checked: snapshot.data?.autostartBreak ?? false,
                          onValueChanged: (checked) {
                            _bloc.setAutostartBreak(checked);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CheckboxWithText(
                          text: AppLocalizations.of(context)!.settingsAutostartPomodoros,
                          checked: snapshot.data?.autostartPomodoro ?? false,
                          onValueChanged: (checked) {
                            _bloc.setAutostartPomodoro(checked);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
