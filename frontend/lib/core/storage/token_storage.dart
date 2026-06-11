import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/storage/local_store.dart';

class TokenStorage {
  TokenStorage(this._store);

  final LocalStore _store;

  static const _tokenKey = 'accessToken';

  String? get token => _store.getString(_tokenKey);

  Future<void> saveToken(String token) => _store.setString(_tokenKey, token);

  Future<void> clear() => _store.remove(_tokenKey);
}

final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage(ref.watch(localStoreProvider));
});
