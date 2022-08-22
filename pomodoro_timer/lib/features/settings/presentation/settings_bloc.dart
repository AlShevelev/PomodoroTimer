import 'dart:async';

import '../../../core/bloc/bloc_base.dart';
import '../../../core/storage/key_value_storage.dart';
import '../../../core/storage/settings/settings_default.dart';
import '../../../core/storage/settings/settings_keys.dart';
import '../domain/model/settings.dart';

class SettingsBloc extends BlocBase {
  final StreamController<Settings> _settings = StreamController<Settings>();

  Sink<Settings> get _inSettings => _settings.sink;

  Stream<Settings> get settings => _settings.stream;

  Settings? _lastSettings;

  final KeyValueStorage _storage = KeyValueStorage();

  /// Loads an initial settings
  void loadSettings() async {
    final Settings initialItem = Settings(
      pomodoroDuration: await _storage.getInt(SettingsKeys.pomodoroDuration) ?? SettingsDefault.pomodoroDuration,
      shortBreakDuration: await _storage.getInt(SettingsKeys.shortBreakDuration) ?? SettingsDefault.shortBreakDuration,
      longBreakDuration: await _storage.getInt(SettingsKeys.longBreakDuration) ?? SettingsDefault.longBreakDuration,
      pomodoroInSeries: await _storage.getInt(SettingsKeys.pomodoroInSeries) ?? SettingsDefault.pomodoroInSeries,
      pomodoroTotal: await _storage.getInt(SettingsKeys.pomodoroTotal) ?? SettingsDefault.pomodoroTotal,
      autostartBreak: await _storage.getBool(SettingsKeys.autostartBreak) ?? SettingsDefault.autostartBreak,
      autostartPomodoro: await _storage.getBool(SettingsKeys.autostartPomodoro) ?? SettingsDefault.autostartPomodoro,
    );

    _inSettings.add(initialItem);
    _lastSettings = initialItem;
  }

  void setPomodoroDuration(int value) {
    _updateIntSettings(20, 30, value, () {
      _storage.setInt(SettingsKeys.pomodoroDuration, value);
      return _lastSettings!.copy(pomodoroDuration: value);
    });
  }

  void setShortBreakDuration(int value) {
    _updateIntSettings(3, 7, value, () {
      _storage.setInt(SettingsKeys.shortBreakDuration, value);
      return _lastSettings!.copy(shortBreakDuration: value);
    });
  }

  void setLongBreakDuration(int value) {
    _updateIntSettings(10, 20, value, () {
      _storage.setInt(SettingsKeys.longBreakDuration, value);
      return _lastSettings!.copy(longBreakDuration: value);
    });
  }

  void setPomodoroInSeries(int value) {
    _updateIntSettings(3, 5, value, () {
      _storage.setInt(SettingsKeys.pomodoroInSeries, value);
      return _lastSettings!.copy(pomodoroInSeries: value);
    });
  }

  void setPomodoroTotal(int value) {
    _updateIntSettings(10, 20, value, () {
      _storage.setInt(SettingsKeys.pomodoroTotal, value);
      return _lastSettings!.copy(pomodoroTotal: value);
    });
  }

  void setAutostartBreak(bool value) {
    _updateBoolSettings(() {
      _storage.setBool(SettingsKeys.autostartBreak, value);
      return _lastSettings!.copy(autostartBreak: value);
    });
  }

  void setAutostartPomodoro(bool value) {
    _updateBoolSettings(() {
      _storage.setBool(SettingsKeys.autostartPomodoro, value);
      return _lastSettings!.copy(autostartPomodoro: value);
    });
  }

  void _updateIntSettings(int min, int max, int value, Settings Function() updateAction) {
    if (value < min || value > max) {
      return;
    }

    final newSettings = updateAction();

    _inSettings.add(newSettings);
    _lastSettings = newSettings;
  }

  void _updateBoolSettings(Settings Function() updateAction) {
    final newSettings = updateAction();

    _inSettings.add(newSettings);
    _lastSettings = newSettings;
  }

  @override
  void dispose() {
    _settings.close();
  }
}
