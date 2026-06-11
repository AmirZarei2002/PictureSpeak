import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_users_controller.dart';
import 'package:frontend/features/admin/data/admin_user.dart';
import 'package:frontend/features/auth/data/user.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminUsersScreen extends ConsumerStatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  ConsumerState<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends ConsumerState<AdminUsersScreen> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(adminUsersFilterProvider.notifier).setSearch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(adminUsersFilterProvider);
    final usersAsync = ref.watch(adminUsersListProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.users)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: l10n.searchUsersHint,
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: Text(l10n.admins),
                  selected: filter.role == UserRole.admin,
                  onSelected: (selected) {
                    ref
                        .read(adminUsersFilterProvider.notifier)
                        .setRole(selected ? UserRole.admin : null);
                  },
                ),
                FilterChip(
                  label: Text(l10n.users),
                  selected: filter.role == UserRole.user,
                  onSelected: (selected) {
                    ref
                        .read(adminUsersFilterProvider.notifier)
                        .setRole(selected ? UserRole.user : null);
                  },
                ),
                FilterChip(
                  label: Text(l10n.guests),
                  selected: filter.isGuest == true,
                  onSelected: (selected) {
                    ref
                        .read(adminUsersFilterProvider.notifier)
                        .setIsGuest(selected ? true : null);
                  },
                ),
                FilterChip(
                  label: Text(l10n.registered),
                  selected: filter.isGuest == false,
                  onSelected: (selected) {
                    ref
                        .read(adminUsersFilterProvider.notifier)
                        .setIsGuest(selected ? false : null);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: usersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(l10n.usersLoadFailed(e)),
                ),
              ),
              data: (paged) {
                if (paged.data.isEmpty) {
                  return Center(child: Text(l10n.noUsersMatch));
                }
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(adminUsersListProvider),
                  child: ListView.separated(
                    itemCount: paged.data.length + 1,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      if (index == paged.data.length) {
                        return _PaginationBar(meta: paged.meta);
                      }
                      return _UserTile(user: paged.data[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _UserTile extends StatelessWidget {
  const _UserTile({required this.user});

  final AdminUserListItem user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final subtitle = [
      if (user.email != null) user.email!,
      if (user.isGuest) l10n.guestTag,
      l10n.favShort(user.favoritesCount),
      l10n.progShort(user.progressCount),
    ].join(' · ');
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: user.role == UserRole.admin
            ? Colors.amber
            : Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          user.role == UserRole.admin ? Icons.shield : Icons.person,
          color: user.role == UserRole.admin
              ? Colors.black
              : Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      title: Text(
        user.displayName?.isNotEmpty == true
            ? user.displayName!
            : (user.email ?? l10n.guestWithId(user.id.substring(0, 6))),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push('/admin/users/${user.id}'),
    );
  }
}

class _PaginationBar extends ConsumerWidget {
  const _PaginationBar({required this.meta});

  final PaginationMeta meta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(adminUsersFilterProvider.notifier);
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: meta.prevPage == null
                ? null
                : () => notifier.setPage(meta.prevPage!),
            icon: const Icon(Icons.chevron_left),
            label: Text(l10n.prev),
          ),
          Text(l10n.pageInfo(meta.page, meta.lastPage, meta.total)),
          TextButton.icon(
            onPressed: meta.nextPage == null
                ? null
                : () => notifier.setPage(meta.nextPage!),
            icon: const Icon(Icons.chevron_right),
            label: Text(l10n.next),
          ),
        ],
      ),
    );
  }
}
