import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/favorites/data/favorite_item.dart';

class FavoritesRepository {
  FavoritesRepository(this._dio);

  final Dio _dio;

  Future<List<FavoriteItem>> getFavorites() async {
    final response = await _dio.get('/favorites');
    final list = response.data as List<dynamic>;
    return list
        .map((json) => FavoriteItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<void> addFavorite(String itemId) => _dio.put('/favorites/$itemId');

  Future<void> removeFavorite(String itemId) =>
      _dio.delete('/favorites/$itemId');
}

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository(ref.watch(dioProvider));
});
