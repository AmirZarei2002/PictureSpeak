import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_users_controller.dart';
import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/admin/data/admin_user.dart';
import 'package:frontend/features/auth/data/user.dart';
import 'package:frontend/features/favorites/data/favorite_item.dart';

final adminUserDetailProvider =
    FutureProvider.autoDispose.family<AdminUserDetail, String>((ref, id) {
  return ref.watch(adminRepositoryProvider).getUser(id);
});

final adminUserFavoritesProvider = FutureProvider.autoDispose
    .family<PaginatedList<FavoriteItem>, String>((ref, id) {
  return ref.watch(adminRepositoryProvider).getUserFavorites(id);
});

final adminUserProgressProvider = FutureProvider.autoDispose
    .family<PaginatedList<UserProgressRow>, String>((ref, id) {
  return ref.watch(adminRepositoryProvider).getUserProgress(id);
});

class AdminUserActions {
  AdminUserActions(this._ref);

  final Ref _ref;

  Future<void> updateRole(String id, UserRole role) async {
    await _ref.read(adminRepositoryProvider).updateUser(id, role: role);
    _ref.invalidate(adminUserDetailProvider(id));
    _ref.invalidate(adminUsersListProvider);
  }

  Future<void> deleteUser(String id) async {
    await _ref.read(adminRepositoryProvider).deleteUser(id);
    _ref.invalidate(adminUsersListProvider);
  }
}

final adminUserActionsProvider = Provider<AdminUserActions>(
  AdminUserActions.new,
);
