import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_items_controller.dart';
import 'package:frontend/features/admin/data/admin_category.dart';
import 'package:frontend/features/admin/data/admin_item.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminItemsScreen extends ConsumerWidget {
  const AdminItemsScreen({
    super.key,
    required this.categoryId,
    this.category,
  });

  final String categoryId;
  final AdminCategory? category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(adminItemsProvider(categoryId));
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.name ?? l10n.items),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(adminItemsProvider(categoryId)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text(l10n.newLabel),
        onPressed: () =>
            context.push('/admin/categories/$categoryId/items/new'),
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(l10n.loadFailed(e)),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(child: Text(l10n.noItemsToAdd));
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(adminItemsProvider(categoryId)),
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) => _ItemTile(item: items[i]),
            ),
          );
        },
      ),
    );
  }
}

class _ItemTile extends ConsumerWidget {
  const _ItemTile({required this.item});

  final AdminItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final media = [
      if (item.thumbnailPath != null) l10n.mediaThumb,
      if (item.audioPath != null) l10n.mediaAudio,
    ];

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        child: Text(
          item.name.isNotEmpty ? item.name[0].toUpperCase() : '?',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(child: Text(item.name)),
          if (!item.isActive)
            Chip(
              label: Text(l10n.inactiveTag),
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
      subtitle: Text(
        '${l10n.itemSubtitle(item.slug, item.sortOrder)}'
        '${media.isEmpty ? '' : '  ·  ${media.join(", ")}'}',
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          switch (value) {
            case 'edit':
              context.push(
                '/admin/items/${item.id}/edit',
                extra: item,
              );
              break;
            case 'toggle':
              _toggleActive(context, ref);
              break;
            case 'delete':
              _confirmDelete(context, ref);
              break;
          }
        },
        itemBuilder: (_) => [
          PopupMenuItem(value: 'edit', child: Text(l10n.edit)),
          PopupMenuItem(
            value: 'toggle',
            child: Text(item.isActive ? l10n.setInactive : l10n.setActive),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text(l10n.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
      onTap: () => context.push('/admin/items/${item.id}/edit', extra: item),
    );
  }

  Future<void> _toggleActive(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    try {
      await ref.read(adminItemActionsProvider).update(
            item,
            isActive: !item.isActive,
          );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.updateFailed(e))));
      }
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteNamedQuestion(item.name)),
        content: Text(l10n.itemDeletePermanent),
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
      await ref.read(adminItemActionsProvider).delete(item);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.deleteFailed(e))));
      }
    }
  }
}
