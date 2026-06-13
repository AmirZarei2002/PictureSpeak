import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/admin/data/admin_category.dart';
import 'package:frontend/features/admin/data/admin_item.dart';
import 'package:frontend/features/admin/data/admin_user.dart';
import 'package:frontend/features/admin/data/analytics.dart';
import 'package:frontend/features/auth/data/user.dart';

enum AdminUploadKind {
  image('image'),
  thumbnail('thumbnail'),
  audio('audio'),
  categoryCover('category-cover');

  const AdminUploadKind(this.wireValue);
  final String wireValue;
}

class AdminRepository {
  AdminRepository(this._dio);

  final Dio _dio;

  Future<PaginatedList<AdminUserListItem>> listUsers({
    int page = 1,
    int size = 20,
    String? search,
    UserRole? role,
    bool? isGuest,
  }) async {
    final response = await _dio.get(
      '/admin/users',
      queryParameters: {
        'page': page,
        'size': size,
        if (search != null && search.isNotEmpty) 'search': search,
        if (role != null) 'role': role == UserRole.admin ? 'ADMIN' : 'USER',
        if (isGuest != null) 'isGuest': isGuest,
      },
    );
    return PaginatedList.fromJson(
      response.data as Map<String, dynamic>,
      (json) => AdminUserListItem.fromJson(json! as Map<String, dynamic>),
    );
  }

  Future<AdminUserDetail> getUser(String id) async {
    final response = await _dio.get('/admin/users/$id');
    return AdminUserDetail.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AdminUserDetail> updateUser(
    String id, {
    UserRole? role,
    String? displayName,
  }) async {
    final response = await _dio.patch(
      '/admin/users/$id',
      data: {
        if (role != null) 'role': role == UserRole.admin ? 'ADMIN' : 'USER',
        if (displayName != null) 'displayName': displayName,
      },
    );
    return AdminUserDetail.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteUser(String id) => _dio.delete('/admin/users/$id');

  Future<PaginatedList<UserProgressRow>> getUserProgress(
    String id, {
    int page = 1,
    int size = 20,
  }) async {
    final response = await _dio.get(
      '/admin/users/$id/progress',
      queryParameters: {'page': page, 'size': size},
    );
    return PaginatedList.fromJson(
      response.data as Map<String, dynamic>,
      (json) => UserProgressRow.fromJson(json! as Map<String, dynamic>),
    );
  }


  Future<List<AdminCategory>> listAllCategories() async {
    final response = await _dio.get('/admin/categories');
    final list = response.data as List<dynamic>;
    return list
        .map((json) => AdminCategory.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<AdminCategory> createCategory({
    required String name,
    required String slug,
    required String coverImagePath,
    String? colorHex,
    int? sortOrder,
    bool? isActive,
  }) async {
    final response = await _dio.post(
      '/admin/categories',
      data: {
        'name': name,
        'slug': slug,
        'coverImagePath': coverImagePath,
        if (colorHex != null) 'colorHex': colorHex,
        if (sortOrder != null) 'sortOrder': sortOrder,
        if (isActive != null) 'isActive': isActive,
      },
    );
    return AdminCategory.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AdminCategory> updateCategory(
    String id, {
    String? name,
    String? slug,
    String? coverImagePath,
    String? colorHex,
    int? sortOrder,
    bool? isActive,
  }) async {
    final response = await _dio.patch(
      '/admin/categories/$id',
      data: {
        if (name != null) 'name': name,
        if (slug != null) 'slug': slug,
        if (coverImagePath != null) 'coverImagePath': coverImagePath,
        if (colorHex != null) 'colorHex': colorHex,
        if (sortOrder != null) 'sortOrder': sortOrder,
        if (isActive != null) 'isActive': isActive,
      },
    );
    return AdminCategory.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteCategory(String id) =>
      _dio.delete('/admin/categories/$id');


  Future<List<AdminItem>> listItems(String categoryId) async {
    final response = await _dio.get('/admin/categories/$categoryId/items');
    final list = response.data as List<dynamic>;
    return list
        .map((json) => AdminItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<AdminItem> createItem(
    String categoryId, {
    required String name,
    required String slug,
    required String imagePath,
    String? thumbnailPath,
    String? audioPath,
    int? sortOrder,
    bool? isActive,
  }) async {
    final response = await _dio.post(
      '/admin/categories/$categoryId/items',
      data: {
        'name': name,
        'slug': slug,
        'imagePath': imagePath,
        if (thumbnailPath != null) 'thumbnailPath': thumbnailPath,
        if (audioPath != null) 'audioPath': audioPath,
        if (sortOrder != null) 'sortOrder': sortOrder,
        if (isActive != null) 'isActive': isActive,
      },
    );
    return AdminItem.fromJson(response.data as Map<String, dynamic>);
  }

  Future<AdminItem> updateItem(
    String id, {
    String? name,
    String? slug,
    String? imagePath,
    String? thumbnailPath,
    String? audioPath,
    int? sortOrder,
    bool? isActive,
  }) async {
    final response = await _dio.patch(
      '/admin/items/$id',
      data: {
        if (name != null) 'name': name,
        if (slug != null) 'slug': slug,
        if (imagePath != null) 'imagePath': imagePath,
        if (thumbnailPath != null) 'thumbnailPath': thumbnailPath,
        if (audioPath != null) 'audioPath': audioPath,
        if (sortOrder != null) 'sortOrder': sortOrder,
        if (isActive != null) 'isActive': isActive,
      },
    );
    return AdminItem.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> deleteItem(String id) => _dio.delete('/admin/items/$id');


  Future<String> uploadFile({
    required String localFilePath,
    required String filename,
    required AdminUploadKind kind,
  }) async {
    final form = FormData.fromMap({
      'kind': kind.wireValue,
      'file': await MultipartFile.fromFile(localFilePath, filename: filename),
    });
    final response = await _dio.post(
      '/admin/upload',
      data: form,
      options: Options(contentType: 'multipart/form-data'),
    );
    final data = response.data as Map<String, dynamic>;
    return data['path'] as String;
  }


  Future<AnalyticsOverview> getOverview() async {
    final response = await _dio.get('/admin/analytics/overview');
    return AnalyticsOverview.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<TopItem>> getTopItems({int limit = 10, int? days}) async {
    final response = await _dio.get(
      '/admin/analytics/top-items',
      queryParameters: {
        'limit': limit,
        if (days != null) 'days': days,
      },
    );
    final list = response.data as List<dynamic>;
    return list
        .map((json) => TopItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<ActiveUsers> getActiveUsers({int days = 30}) async {
    final response = await _dio.get(
      '/admin/analytics/active-users',
      queryParameters: {'days': days},
    );
    return ActiveUsers.fromJson(response.data as Map<String, dynamic>);
  }
}

final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => AdminRepository(ref.watch(dioProvider)),
);
