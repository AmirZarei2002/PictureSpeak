import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/storage/local_store.dart';
import 'package:frontend/features/settings/data/settings_repository.dart';

enum AppTextScale {
  normal('normal', 1.0),
  large('large', 1.2),
  xlarge('xlarge', 1.4);

  const AppTextScale(this.apiValue, this.factor);

  final String apiValue;
  final double factor;

  static AppTextScale fromApi(String? value) => AppTextScale.values.firstWhere(
    (e) => e.apiValue == value,
    orElse: () => AppTextScale.normal,
  );
}

enum AppLanguage {
  persian('fa'),
  english('en');

  const AppLanguage(this.code);

  final String code;

  Locale get locale => Locale(code);

  static AppLanguage fromCode(String? code) => AppLanguage.values.firstWhere(
    (e) => e.code == code,
    orElse: () => AppLanguage.persian,
  );
}

class AppSettings {
  const AppSettings({
    this.textScale = AppTextScale.normal,
    this.themeMode = ThemeMode.system,
    this.language = AppLanguage.persian,
  });

  final AppTextScale textScale;
  final ThemeMode themeMode;
  final AppLanguage language;

  AppSettings copyWith({
    AppTextScale? textScale,
    ThemeMode? themeMode,
    AppLanguage? language,
  }) => AppSettings(
    textScale: textScale ?? this.textScale,
    themeMode: themeMode ?? this.themeMode,
    language: language ?? this.language,
  );
}

class SettingsController extends Notifier<AppSettings> {
  static const _textScaleKey = 'textScale';
  static const _themeModeKey = 'themeMode';
  static const _languageKey = 'language';

  LocalStore get _store => ref.read(localStoreProvider);

  @override
  AppSettings build() {
    final textScale = AppTextScale.fromApi(_store.getString(_textScaleKey));
    final themeName = _store.getString(_themeModeKey);
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => ThemeMode.system,
    );
    final language = AppLanguage.fromCode(_store.getString(_languageKey));
    return AppSettings(
      textScale: textScale,
      themeMode: themeMode,
      language: language,
    );
  }

  void setTextScale(AppTextScale scale) {
    state = state.copyWith(textScale: scale);
    _store.setString(_textScaleKey, scale.apiValue);
    _sync(textScale: scale.apiValue);
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _store.setString(_themeModeKey, mode.name);
    _sync(themeMode: mode.name);
  }

  void setLanguage(AppLanguage language) {
    state = state.copyWith(language: language);
    _store.setString(_languageKey, language.code);
  }

  void _sync({String? textScale, String? themeMode}) {
    ref
        .read(settingsRepositoryProvider)
        .updatePreferences(textScale: textScale, themeMode: themeMode)
        .ignore();
  }
}

final settingsProvider = NotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);
