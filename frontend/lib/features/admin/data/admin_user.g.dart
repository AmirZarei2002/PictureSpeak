// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedList<T> _$PaginatedListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginatedList<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaginatedListToJson<T>(
  _PaginatedList<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'meta': instance.meta,
};

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      lastPage: (json['lastPage'] as num).toInt(),
      prevPage: (json['prevPage'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'size': instance.size,
      'lastPage': instance.lastPage,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
    };

_AdminUserListItem _$AdminUserListItemFromJson(Map<String, dynamic> json) =>
    _AdminUserListItem(
      id: json['id'] as String,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      role:
          $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.user,
      isGuest: json['isGuest'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      favoritesCount: (json['favoritesCount'] as num).toInt(),
      progressCount: (json['progressCount'] as num).toInt(),
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
    );

Map<String, dynamic> _$AdminUserListItemToJson(_AdminUserListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'role': _$UserRoleEnumMap[instance.role]!,
      'isGuest': instance.isGuest,
      'createdAt': instance.createdAt.toIso8601String(),
      'favoritesCount': instance.favoritesCount,
      'progressCount': instance.progressCount,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {UserRole.user: 'USER', UserRole.admin: 'ADMIN'};

_AdminUserDetail _$AdminUserDetailFromJson(Map<String, dynamic> json) =>
    _AdminUserDetail(
      id: json['id'] as String,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      role:
          $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.user,
      isGuest: json['isGuest'] as bool,
      textScale: json['textScale'] as String,
      themeMode: json['themeMode'] as String,
      speechRate: (json['speechRate'] as num).toDouble(),
      soundEffectsOn: json['soundEffectsOn'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      favoritesCount: (json['favoritesCount'] as num).toInt(),
      progressCount: (json['progressCount'] as num).toInt(),
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
    );

Map<String, dynamic> _$AdminUserDetailToJson(_AdminUserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'role': _$UserRoleEnumMap[instance.role]!,
      'isGuest': instance.isGuest,
      'textScale': instance.textScale,
      'themeMode': instance.themeMode,
      'speechRate': instance.speechRate,
      'soundEffectsOn': instance.soundEffectsOn,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'favoritesCount': instance.favoritesCount,
      'progressCount': instance.progressCount,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
    };

_UserProgressRow _$UserProgressRowFromJson(Map<String, dynamic> json) =>
    _UserProgressRow(
      itemId: json['itemId'] as String,
      itemSlug: json['itemSlug'] as String,
      itemName: json['itemName'] as String,
      categoryId: json['categoryId'] as String,
      categorySlug: json['categorySlug'] as String,
      categoryName: json['categoryName'] as String,
      viewCount: (json['viewCount'] as num).toInt(),
      listenCount: (json['listenCount'] as num).toInt(),
      firstSeenAt: DateTime.parse(json['firstSeenAt'] as String),
      lastSeenAt: DateTime.parse(json['lastSeenAt'] as String),
    );

Map<String, dynamic> _$UserProgressRowToJson(_UserProgressRow instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemSlug': instance.itemSlug,
      'itemName': instance.itemName,
      'categoryId': instance.categoryId,
      'categorySlug': instance.categorySlug,
      'categoryName': instance.categoryName,
      'viewCount': instance.viewCount,
      'listenCount': instance.listenCount,
      'firstSeenAt': instance.firstSeenAt.toIso8601String(),
      'lastSeenAt': instance.lastSeenAt.toIso8601String(),
    };
