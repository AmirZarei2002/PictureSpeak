import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/categories/data/category_repository.dart';
import 'package:frontend/features/categories/data/learning_item.dart';

final categoryItemsProvider =
    FutureProvider.family<List<LearningItem>, String>((ref, slug) {
      return ref.watch(categoryRepositoryProvider).fetchItems(slug);
    });
