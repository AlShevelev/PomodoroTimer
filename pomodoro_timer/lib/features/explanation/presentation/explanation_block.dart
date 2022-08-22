import 'dart:async';

import '../../../core/bloc/bloc_base.dart';
import '../../../core/storage/key_value_storage.dart';
import '../../../core/storage/settings/settings_default.dart';
import '../../../core/storage/settings/settings_keys.dart';
import '../domain/model/settings.dart';

class ExplanationBloc extends BlocBase {
  final StreamController<Settings> _settings = StreamController<Settings>();

  Sink<Settings> get _inSettings => _settings.sink;

  Stream<Settings> get settings => _settings.stream;

  final KeyValueStorage _storage = KeyValueStorage();

  /// Loads an initial settings
  void loadSettings() async {
    final Settings initialItem = Settings(
      pomodoroDuration: await _storage.getInt(SettingsKeys.pomodoroDuration) ?? SettingsDefault.pomodoroDuration,
      shortBreakDuration: await _storage.getInt(SettingsKeys.shortBreakDuration) ?? SettingsDefault.shortBreakDuration,
      longBreakDuration: await _storage.getInt(SettingsKeys.longBreakDuration) ?? SettingsDefault.longBreakDuration,
      pomodoroInSeries: await _storage.getInt(SettingsKeys.pomodoroInSeries) ?? SettingsDefault.pomodoroInSeries,
    );

    _inSettings.add(initialItem);
  }

  @override
  void dispose() {
    _settings.close();
  }
}
