import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_timer/features/settings/domain/total_time_calculator.dart';

void main() {
  test('Pomodoro quantity is less than the series size', () {
    // Arrange & act
    final duration = TotalTimeCalculator.calculate(
      pomodoroDuration: 25,
      shortBreakDuration: 5,
      longBreakDuration: 15,
      pomodoroInSeries: 4,
      pomodoroTotal: 3,
    );

    // Assert
    expect(duration.hour, 1);
    expect(duration.minutes, 25);
  });

  test('Pomodoro quantity is as same as the series size', () {
    // Arrange & act
    final duration = TotalTimeCalculator.calculate(
      pomodoroDuration: 25,
      shortBreakDuration: 5,
      longBreakDuration: 15,
      pomodoroInSeries: 4,
      pomodoroTotal: 4,
    );

    // Assert
    expect(duration.hour, 1);
    expect(duration.minutes, 55);
  });

  test('Pomodoro quantity is greater than the series size', () {
    // Arrange & act
    final duration = TotalTimeCalculator.calculate(
      pomodoroDuration: 25,
      shortBreakDuration: 5,
      longBreakDuration: 15,
      pomodoroInSeries: 4,
      pomodoroTotal: 6,
    );

    // Assert
    expect(duration.hour, 3);
    expect(duration.minutes, 5);
  });

  test('Integer number of series', () {
    // Arrange & act
    final duration = TotalTimeCalculator.calculate(
      pomodoroDuration: 25,
      shortBreakDuration: 5,
      longBreakDuration: 15,
      pomodoroInSeries: 4,
      pomodoroTotal: 8,
    );

    // Assert
    expect(duration.hour, 4);
    expect(duration.minutes, 5);
  });
}