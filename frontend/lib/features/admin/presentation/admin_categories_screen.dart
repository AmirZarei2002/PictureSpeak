import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_categories_controller.dart';
import 'package:frontend/features/admin/data/admin_category.dart';
import 'package:frontend/l10n/l10n_ext.dart';

class AdminCategoriesScreen extends ConsumerWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(adminCategoriesProvider);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.categories),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(adminCategoriesProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: Text(l10n.newLabel),
        onPressed: () => context.push('/admin/categories/new'),
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(l10n.loadFailed(e)),
          ),
        ),
        data: (categories) {
          if (categories.isEmpty) {
            return Center(child: Text(l10n.noCategoriesYet));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(adminCategoriesProvider),
            child: ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) => _CategoryTile(category: categories[i]),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryTile extends ConsumerWidget {
  const _CategoryTile({required this.category});

  final AdminCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = _parseColor(category.colorHex);
    final l10n = context.l10n;
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          category.name.isNotEmpty ? category.name[0].toUpperCase() : '?',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Row(
        children: [
          Expanded(child: Text(category.name)),
          if (!category.isActive)
            Chip(
              label: Text(l10n.inactiveTag),
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
      subtitle: Text(
        l10n.categorySubtitle(
          category.slug,
          category.sortOrder,
          category.itemCount,
        ),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          switch (value) {
            case 'edit':
              context.push('/admin/categories/${category.id}/edit', extra: category);
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
          PopupMenuItem(value: 'edit', child: Text(l10n.editCategory)),
          PopupMenuItem(
            value: 'toggle',
            child: Text(category.isActive ? l10n.setInactive : l10n.setActive),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text(l10n.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
      onTap: () => context.push(
        '/admin/categories/${category.id}/items',
        extra: category,
      ),
    );
  }

  Future<void> _toggleActive(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    try {
      await ref.read(adminCategoryActionsProvider).update(
            category.id,
            isActive: !category.isActive,
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
        title: Text(l10n.deleteNamedQuestion(category.name)),
        content: Text(
          category.itemCount > 0
              ? l10n.categoryHasItems(category.itemCount)
              : l10n.categoryDeletePermanent,
        ),
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
      await ref.read(adminCategoryActionsProvider).delete(category.id);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l10n.deleteFailed(e))));
      }
    }
  }

  Color _parseColor(String hex) {
    final cleaned = hex.replaceFirst('#', '');
    return Color(int.parse('0xff$cleaned'));
  }
}
