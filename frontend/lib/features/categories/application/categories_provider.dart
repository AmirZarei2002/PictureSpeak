import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/categories/data/category.dart';
import 'package:frontend/features/categories/data/category_repository.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) {
  return ref.watch(categoryRepositoryProvider).fetchCategories();
});
