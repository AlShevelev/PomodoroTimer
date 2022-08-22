/// A set of settings for the explanation screen
class Settings {
  Settings({
    required this.pomodoroDuration,
    required this.shortBreakDuration,
    required this.longBreakDuration,
    required this.pomodoroInSeries,
  });

  /// In minutes
  final int pomodoroDuration;

  /// In minutes
  final int shortBreakDuration;

  /// In minutes
  final int longBreakDuration;

  final int pomodoroInSeries;

  Settings copy({
    int? pomodoroDuration,
    int? shortBreakDuration,
    int? longBreakDuration,
    int? pomodoroInSeries,
  }) {
    return Settings(
      pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
      shortBreakDuration: shortBreakDuration ?? this.shortBreakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      pomodoroInSeries: pomodoroInSeries ?? this.pomodoroInSeries,
    );
  }
}
