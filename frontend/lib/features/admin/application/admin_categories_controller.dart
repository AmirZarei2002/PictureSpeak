import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/data/admin_category.dart';
import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/categories/application/categories_provider.dart';

final adminCategoriesProvider =
    FutureProvider.autoDispose<List<AdminCategory>>((ref) {
  return ref.watch(adminRepositoryProvider).listAllCategories();
});

class AdminCategoryActions {
  AdminCategoryActions(this._ref);

  final Ref _ref;

  Future<AdminCategory> create({
    required String name,
    required String slug,
    required String coverImagePath,
    String? colorHex,
    int? sortOrder,
    bool? isActive,
  }) async {
    final created = await _ref.read(adminRepositoryProvider).createCategory(
          name: name,
          slug: slug,
          coverImagePath: coverImagePath,
          colorHex: colorHex,
          sortOrder: sortOrder,
          isActive: isActive,
        );
    _invalidateAll();
    return created;
  }

  Future<AdminCategory> update(
    String id, {
    String? name,
    String? slug,
    String? coverImagePath,
    String? colorHex,
    int? sortOrder,
    bool? isActive,
  }) async {
    final updated = await _ref.read(adminRepositoryProvider).updateCategory(
          id,
          name: name,
          slug: slug,
          coverImagePath: coverImagePath,
          colorHex: colorHex,
          sortOrder: sortOrder,
          isActive: isActive,
        );
    _invalidateAll();
    return updated;
  }

  Future<void> delete(String id) async {
    await _ref.read(adminRepositoryProvider).deleteCategory(id);
    _invalidateAll();
  }

  void _invalidateAll() {
    _ref.invalidate(adminCategoriesProvider);
    _ref.invalidate(categoriesProvider);
  }
}

final adminCategoryActionsProvider = Provider<AdminCategoryActions>(
  AdminCategoryActions.new,
);
