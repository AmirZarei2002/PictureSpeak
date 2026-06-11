import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/api/api_client.dart';

class SettingsRepository {
  SettingsRepository(this._dio);

  final Dio _dio;

  Future<void> updatePreferences({String? textScale, String? themeMode}) {
    return _dio.patch(
      '/me',
      data: {
        'textScale': ?textScale,
        'themeMode': ?themeMode,
      },
    );
  }
}

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(dioProvider));
});
