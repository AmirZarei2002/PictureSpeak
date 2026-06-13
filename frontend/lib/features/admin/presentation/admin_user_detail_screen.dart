import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_user_detail_controller.dart';
import 'package:frontend/features/admin/data/admin_user.dart';
import 'package:frontend/features/auth/application/auth_controller.dart';
import 'package:frontend/features/auth/data/user.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminUserDetailScreen extends ConsumerWidget {
  const AdminUserDetailScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(adminUserDetailProvider(userId));
    final l10n = context.l10n;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.userTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.info, icon: const Icon(Icons.person)),
              Tab(text: l10n.progress, icon: const Icon(Icons.show_chart)),
            ],
          ),
        ),
        body: detailAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text(l10n.loadFailed(e))),
          data: (user) => TabBarView(
            children: [
              _InfoTab(user: user),
              _ProgressTab(userId: userId),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTab extends ConsumerWidget {
  const _InfoTab({required this.user});

  final AdminUserDetail user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(authControllerProvider);
    final isSelf = me?.id == user.id;
    final l10n = context.l10n;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _kv(l10n.emailLabel, user.email ?? '—'),
        _kv(l10n.displayName, user.displayName ?? '—'),
        _kv(l10n.role, user.role == UserRole.admin ? l10n.roleAdmin : l10n.roleUser),
        _kv(l10n.guest, user.isGuest ? l10n.yes : l10n.no),
        _kv(l10n.progressRows, context.localizedNumber(user.progressCount)),
        _kv(l10n.lastSeen, user.lastSeenAt?.toIso8601String() ?? l10n.never),
        _kv(l10n.created, user.createdAt.toIso8601String()),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 16),
        Text(
          l10n.actions,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: isSelf
              ? null
              : () => _confirmRoleToggle(context, ref, user),
          icon: Icon(
            user.role == UserRole.admin
                ? Icons.arrow_downward
                : Icons.arrow_upward,
          ),
          label: Text(
            user.role == UserRole.admin
                ? l10n.demoteToUser
                : l10n.promoteToAdmin,
          ),
        ),
        const SizedBox(height: 8),
        FilledButton.icon(
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          onPressed: isSelf ? null : () => _confirmDelete(context, ref, user),
          icon: const Icon(Icons.delete_forever),
          label: Text(l10n.deleteUser),
        ),
        if (isSelf)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              l10n.ownAccountNote,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
      ],
    );
  }

  Widget _kv(String key, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              child: Text(
                key,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(child: Text(value)),
          ],
        ),
      );

  Future<void> _confirmRoleToggle(
    BuildContext context,
    WidgetRef ref,
    AdminUserDetail user,
  ) async {
    final l10n = context.l10n;
    final next = user.role == UserRole.admin ? UserRole.user : UserRole.admin;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          next == UserRole.admin ? l10n.promoteQuestion : l10n.demoteQuestion,
        ),
        content: Text(
          next == UserRole.admin ? l10n.promoteBody : l10n.demoteBody,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await ref.read(adminUserActionsProvider).updateRole(user.id, next);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.updateFailed(e))),
        );
      }
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AdminUserDetail user,
  ) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteUserQuestion),
        content: Text(l10n.deleteUserBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await ref.read(adminUserActionsProvider).deleteUser(user.id);
      if (context.mounted) context.pop();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.deleteFailed(e))),
        );
      }
    }
  }
}

class _ProgressTab extends ConsumerWidget {
  const _ProgressTab({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progAsync = ref.watch(adminUserProgressProvider(userId));
    return progAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text(context.l10n.failed(e))),
      data: (paged) {
        if (paged.data.isEmpty) {
          return Center(child: Text(context.l10n.noProgressYet));
        }
        return ListView.separated(
          itemCount: paged.data.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final r = paged.data[i];
            return ListTile(
              leading: const Icon(Icons.visibility),
              title: Text(r.itemName),
              subtitle: Text(
                '${r.categoryName} · '
                '${context.l10n.progressViewsListens(r.viewCount, r.listenCount)}',
              ),
              trailing: Text(
                r.lastSeenAt.toIso8601String().substring(0, 10),
                style: const TextStyle(fontSize: 12),
              ),
            );
          },
        );
      },
    );
  }
}
