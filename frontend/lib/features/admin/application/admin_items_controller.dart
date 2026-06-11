import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/application/admin_categories_controller.dart';
import 'package:frontend/features/admin/data/admin_item.dart';
import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/categories/application/categories_provider.dart';
import 'package:frontend/features/categories/application/category_items_provider.dart';

final adminItemsProvider =
    FutureProvider.autoDispose.family<List<AdminItem>, String>((ref, categoryId) {
  return ref.watch(adminRepositoryProvider).listItems(categoryId);
});

class AdminItemActions {
  AdminItemActions(this._ref);

  final Ref _ref;

  Future<AdminItem> create(
    String categoryId, {
    required String name,
    required String slug,
    required String imagePath,
    String? thumbnailPath,
    String? audioPath,
    int? sortOrder,
    bool? isActive,
  }) async {
    final created = await _ref.read(adminRepositoryProvider).createItem(
          categoryId,
          name: name,
          slug: slug,
          imagePath: imagePath,
          thumbnailPath: thumbnailPath,
          audioPath: audioPath,
          sortOrder: sortOrder,
          isActive: isActive,
        );
    _invalidate(categoryId);
    return created;
  }

  Future<AdminItem> update(
    AdminItem existing, {
    String? name,
    String? slug,
    String? imagePath,
    String? thumbnailPath,
    String? audioPath,
    int? sortOrder,
    bool? isActive,
  }) async {
    final updated = await _ref.read(adminRepositoryProvider).updateItem(
          existing.id,
          name: name,
          slug: slug,
          imagePath: imagePath,
          thumbnailPath: thumbnailPath,
          audioPath: audioPath,
          sortOrder: sortOrder,
          isActive: isActive,
        );
    _invalidate(existing.categoryId);
    return updated;
  }

  Future<void> delete(AdminItem existing) async {
    await _ref.read(adminRepositoryProvider).deleteItem(existing.id);
    _invalidate(existing.categoryId);
  }

  void _invalidate(String categoryId) {
    _ref.invalidate(adminItemsProvider(categoryId));
    _ref.invalidate(adminCategoriesProvider);
    _ref.invalidate(categoriesProvider);
    _ref.invalidate(categoryItemsProvider);
  }
}

final adminItemActionsProvider = Provider<AdminItemActions>(
  AdminItemActions.new,
);
