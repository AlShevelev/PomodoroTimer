/// All settings are here
class Settings {
  Settings({
    required this.pomodoroDuration,
    required this.shortBreakDuration,
    required this.longBreakDuration,
    required this.pomodoroInSeries,
    required this.pomodoroTotal,
    required this.autostartBreak,
    required this.autostartPomodoro,
  });

  /// In minutes
  final int pomodoroDuration;

  /// In minutes
  final int shortBreakDuration;

  /// In minutes
  final int longBreakDuration;

  final int pomodoroInSeries;
  final int pomodoroTotal;

  final bool autostartBreak;
  final bool autostartPomodoro;

  Settings copy({
    int? pomodoroDuration,
    int? shortBreakDuration,
    int? longBreakDuration,
    int? pomodoroInSeries,
    int? pomodoroTotal,
    bool? autostartBreak,
    bool? autostartPomodoro,
  }) {
    return Settings(
      pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
      shortBreakDuration: shortBreakDuration ?? this.shortBreakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      pomodoroInSeries: pomodoroInSeries ?? this.pomodoroInSeries,
      pomodoroTotal: pomodoroTotal ?? this.pomodoroTotal,
      autostartBreak: autostartBreak ?? this.autostartBreak,
      autostartPomodoro: autostartPomodoro ?? this.autostartPomodoro,
    );
  }
}
