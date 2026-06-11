import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/storage/token_storage.dart';

const String _apiHost = String.fromEnvironment(
  'API_HOST',
  defaultValue: '10.0.2.2:8000',
);

// On web the app is served by nginx, which reverse-proxies /api and /static
// to the backend container — using relative URLs keeps requests same-origin
// (no CORS) and works regardless of the host:port the user opened.
final String apiBaseUrl = kIsWeb ? '/api/v1' : 'http://$_apiHost/api/v1';

final String mediaBaseUrl = kIsWeb ? '/static' : 'http://$_apiHost/static';

String mediaUrl(String relativePath) => '$mediaBaseUrl/$relativePath';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: Headers.jsonContentType,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = ref.read(tokenStorageProvider).token;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options); 
      },
    ),
  );

  return dio;
});
