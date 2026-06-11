import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/auth/data/user.dart';

typedef AuthResult = ({String accessToken, User user});

class AuthRepository {
  AuthRepository(this._dio);

  final Dio _dio;

  Future<AuthResult> guest() async {
    final response = await _dio.post('/auth/guest');
    return _parse(response.data);
  }

  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return _parse(response.data);
  }

  Future<AuthResult> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final response = await _dio.post(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'displayName': ?displayName,
      },
    );
    return _parse(response.data);
  }

  Future<User> me() async {
    final response = await _dio.get('/me');
    return User.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> logout() async {
    await _dio.post('/auth/logout');
  }

  AuthResult _parse(dynamic data) {
    final map = data as Map<String, dynamic>;
    return (
      accessToken: map['accessToken'] as String,
      user: User.fromJson(map['user'] as Map<String, dynamic>),
    );
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(dioProvider));
});
