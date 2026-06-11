import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/categories/data/category.dart';
import 'package:frontend/features/categories/data/learning_item.dart';

class CategoryRepository {
  CategoryRepository(this._dio);

  final Dio _dio;

  Future<List<Category>> fetchCategories() async {
    final response = await _dio.get('/categories');
    final list = response.data as List<dynamic>;
    return list
        .map((json) => Category.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<LearningItem>> fetchItems(String slug) async {
    final response = await _dio.get('/categories/$slug/items');
    final list = response.data as List<dynamic>;
    return list
        .map((json) => LearningItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(dioProvider));
});