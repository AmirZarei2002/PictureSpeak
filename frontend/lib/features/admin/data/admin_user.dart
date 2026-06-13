import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:frontend/features/auth/data/user.dart';

part 'admin_user.freezed.dart';
part 'admin_user.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedList<T> with _$PaginatedList<T> {
  const factory PaginatedList({
    required List<T> data,
    required PaginationMeta meta,
  }) = _PaginatedList<T>;

  factory PaginatedList.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedListFromJson(json, fromJsonT);
}

@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int total,
    required int page,
    required int size,
    required int lastPage,
    int? prevPage,
    int? nextPage,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

@freezed
abstract class AdminUserListItem with _$AdminUserListItem {
  const factory AdminUserListItem({
    required String id,
    String? email,
    String? displayName,
    @Default(UserRole.user) UserRole role,
    required bool isGuest,
    required DateTime createdAt,
    required int progressCount,
    DateTime? lastSeenAt,
  }) = _AdminUserListItem;

  factory AdminUserListItem.fromJson(Map<String, dynamic> json) =>
      _$AdminUserListItemFromJson(json);
}

@freezed
abstract class AdminUserDetail with _$AdminUserDetail {
  const factory AdminUserDetail({
    required String id,
    String? email,
    String? displayName,
    @Default(UserRole.user) UserRole role,
    required bool isGuest,
    required String textScale,
    required String themeMode,
    required double speechRate,
    required bool soundEffectsOn,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int progressCount,
    DateTime? lastSeenAt,
  }) = _AdminUserDetail;

  factory AdminUserDetail.fromJson(Map<String, dynamic> json) =>
      _$AdminUserDetailFromJson(json);
}

@freezed
abstract class UserProgressRow with _$UserProgressRow {
  const factory UserProgressRow({
    required String itemId,
    required String itemSlug,
    required String itemName,
    required String categoryId,
    required String categorySlug,
    required String categoryName,
    required int viewCount,
    required int listenCount,
    required DateTime firstSeenAt,
    required DateTime lastSeenAt,
  }) = _UserProgressRow;

  factory UserProgressRow.fromJson(Map<String, dynamic> json) =>
      _$UserProgressRowFromJson(json);
}
