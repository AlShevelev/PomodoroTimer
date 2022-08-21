import 'model/time_duration.dart';

class TotalTimeCalculator {
  /// Calculates the total duration of working day, bases on source data
  /// [pomodoroDuration] This is the duration of one pomodoro in minutes
  /// [shortBreakDuration] This is the duration of one short break in minutes
  /// [longBreakDuration] This is the duration of one long break in minutes
  /// [pomodoroInSeries] Represents the total quantity of pomodoros in the series.
  /// [pomodoroTotal] Represents the total quantity of pomodoros.
  static TimeDuration calculate({
    required int pomodoroDuration,
    required int shortBreakDuration,
    required int longBreakDuration,
    required int pomodoroInSeries,
    required int pomodoroTotal,
  }) {
    final totalMinutes = _calculateTotalMinutes(
      pomodoroDuration,
      shortBreakDuration,
      longBreakDuration,
      pomodoroInSeries,
      pomodoroTotal,
    );

    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;

    return TimeDuration(hours, minutes);
  }

  static int _calculateTotalMinutes(
    int pomodoroDuration,
    int shortBreakDuration,
    int longBreakDuration,
    int pomodoroInSeries,
    int pomodoroTotal,
  ) {
    if (pomodoroTotal <= pomodoroInSeries) {
      return (pomodoroTotal * pomodoroDuration) + (pomodoroTotal - 1) * shortBreakDuration;
    } else {
      final allPomodoroDuration = pomodoroTotal * pomodoroDuration;
      final numberOfWholeSeries = pomodoroTotal ~/ pomodoroInSeries;
      final allLongBreakDurations = (numberOfWholeSeries - 1) * longBreakDuration;
      final allShortBreakDurations = numberOfWholeSeries * ((pomodoroInSeries - 1) * shortBreakDuration);
      final restPomodoro = pomodoroTotal - (numberOfWholeSeries * pomodoroInSeries);

      int restBlockDuration = 0;

      if (restPomodoro != 0) {
        restBlockDuration = longBreakDuration + ((restPomodoro - 1) * shortBreakDuration);
      } else {
        restBlockDuration = 0;
      }

      return allPomodoroDuration + allLongBreakDurations + allShortBreakDurations + restBlockDuration;
    }
  }
}
