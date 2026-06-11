import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/admin/data/admin_user.dart';
import 'package:frontend/features/auth/data/user.dart';

@immutable
class AdminUsersState {
  const AdminUsersState({
    this.search = '',
    this.role,
    this.isGuest,
    this.page = 1,
    this.size = 20,
  });

  final String search;
  final UserRole? role;
  final bool? isGuest;
  final int page;
  final int size;

  AdminUsersState copyWith({
    String? search,
    Object? role = _sentinel,
    Object? isGuest = _sentinel,
    int? page,
    int? size,
  }) {
    return AdminUsersState(
      search: search ?? this.search,
      role: identical(role, _sentinel) ? this.role : role as UserRole?,
      isGuest: identical(isGuest, _sentinel) ? this.isGuest : isGuest as bool?,
      page: page ?? this.page,
      size: size ?? this.size,
    );
  }

  static const _sentinel = Object();
}

class AdminUsersFilter extends Notifier<AdminUsersState> {
  @override
  AdminUsersState build() => const AdminUsersState();

  void setSearch(String value) =>
      state = state.copyWith(search: value, page: 1);

  void setRole(UserRole? value) => state = state.copyWith(role: value, page: 1);

  void setIsGuest(bool? value) =>
      state = state.copyWith(isGuest: value, page: 1);

  void setPage(int value) => state = state.copyWith(page: value);
}

final adminUsersFilterProvider =
    NotifierProvider<AdminUsersFilter, AdminUsersState>(AdminUsersFilter.new);

final adminUsersListProvider =
    FutureProvider.autoDispose<PaginatedList<AdminUserListItem>>((ref) {
  final filter = ref.watch(adminUsersFilterProvider);
  return ref.watch(adminRepositoryProvider).listUsers(
        page: filter.page,
        size: filter.size,
        search: filter.search.trim().isEmpty ? null : filter.search.trim(),
        role: filter.role,
        isGuest: filter.isGuest,
      );
});
