import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sprintf/sprintf.dart';

import '../../domain/model/settings.dart';
import '../../../../core/ui_kit/style/colors.dart';
import '../../domain/total_time_calculator.dart';

class TotalTime extends StatelessWidget {
  const TotalTime(
    this._settings, {
    Key? key,
  }) : super(key: key);

  final Settings _settings;

  @override
  Widget build(BuildContext context) {
    final duration = TotalTimeCalculator.calculate(
      pomodoroDuration: _settings.pomodoroDuration,
      shortBreakDuration: _settings.shortBreakDuration,
      longBreakDuration: _settings.longBreakDuration,
      pomodoroInSeries: _settings.pomodoroInSeries,
      pomodoroTotal: _settings.pomodoroTotal,
    );

    return Text(
      sprintf(
        AppLocalizations.of(context)!.settingsTotalTime,
        [duration.hour, duration.minutes],
      ),
      style: Theme.of(context).textTheme.bodyText1!.apply(color: AppColors.black),
      textAlign: TextAlign.start,
    );
  }
}
