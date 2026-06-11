import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/storage/token_storage.dart';
import 'package:frontend/features/auth/data/auth_repository.dart';
import 'package:frontend/features/auth/data/user.dart';

class AuthController extends Notifier<User?> {
  @override
  User? build() {
    return null;
  }

  AuthRepository get _repo => ref.read(authRepositoryProvider);
  TokenStorage get _tokens => ref.read(tokenStorageProvider);

  Future<bool> tryRestoreSession() async {
    final token = _tokens.token;
    if (token == null) return false;
    try {
      state = await _repo.me();
      return true;
    } catch (_) {
      await _tokens.clear();
      state = null;
      return false;
    }
  }

  Future<void> signInAsGuest() async {
    final result = await _repo.guest();
    await _tokens.saveToken(result.accessToken);
    state = result.user; 
  }

  Future<void> login({required String email, required String password}) async {
    final result = await _repo.login(email: email, password: password);
    await _tokens.saveToken(result.accessToken);
    state = result.user;
  }

  Future<void> register({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final result = await _repo.register(
      email: email,
      password: password,
      displayName: displayName,
    );
    await _tokens.saveToken(result.accessToken);
    state = result.user;
  }

  Future<void> signOut() async {
    try {
      await _repo.logout();
    } catch (_) {
    }
    await _tokens.clear();
    state = null;
  }
}

final authControllerProvider = NotifierProvider<AuthController, User?>(
  AuthController.new,
);
