import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/favorites/data/favorite_item.dart';
import 'package:frontend/features/favorites/data/favorites_repository.dart';

final favoritesListProvider = FutureProvider<List<FavoriteItem>>((ref) {
  return ref.watch(favoritesRepositoryProvider).getFavorites();
});

class FavoriteIds extends AsyncNotifier<Set<String>> {
  @override
  Future<Set<String>> build() async {
    final favs = await ref.watch(favoritesRepositoryProvider).getFavorites();
    return favs.map((f) => f.itemId).toSet();
  }

  bool contains(String itemId) => state.value?.contains(itemId) ?? false;

  Future<void> toggle(String itemId) async {
    final current = state.value ?? <String>{};
    final wasFavorite = current.contains(itemId);
    final next = {...current};
    if (wasFavorite) {
      next.remove(itemId);
    } else {
      next.add(itemId);
    }
    state = AsyncData(next); 

    final repo = ref.read(favoritesRepositoryProvider);
    try {
      if (wasFavorite) {
        await repo.removeFavorite(itemId);
      } else {
        await repo.addFavorite(itemId);
      }
      ref.invalidate(favoritesListProvider);
    } catch (e) {
      state = AsyncData(current); 
      rethrow;
    }
  }
}

final favoriteIdsProvider = AsyncNotifierProvider<FavoriteIds, Set<String>>(
  FavoriteIds.new,
);
