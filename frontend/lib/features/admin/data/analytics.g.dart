// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsOverview _$AnalyticsOverviewFromJson(Map<String, dynamic> json) =>
    _AnalyticsOverview(
      totalUsers: (json['totalUsers'] as num).toInt(),
      guestUsers: (json['guestUsers'] as num).toInt(),
      registeredUsers: (json['registeredUsers'] as num).toInt(),
      totalAdmins: (json['totalAdmins'] as num).toInt(),
      totalCategories: (json['totalCategories'] as num).toInt(),
      activeCategories: (json['activeCategories'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      activeItems: (json['activeItems'] as num).toInt(),
      totalProgressRows: (json['totalProgressRows'] as num).toInt(),
    );

Map<String, dynamic> _$AnalyticsOverviewToJson(_AnalyticsOverview instance) =>
    <String, dynamic>{
      'totalUsers': instance.totalUsers,
      'guestUsers': instance.guestUsers,
      'registeredUsers': instance.registeredUsers,
      'totalAdmins': instance.totalAdmins,
      'totalCategories': instance.totalCategories,
      'activeCategories': instance.activeCategories,
      'totalItems': instance.totalItems,
      'activeItems': instance.activeItems,
      'totalProgressRows': instance.totalProgressRows,
    };

_TopItem _$TopItemFromJson(Map<String, dynamic> json) => _TopItem(
  itemId: json['itemId'] as String,
  itemSlug: json['itemSlug'] as String,
  itemName: json['itemName'] as String,
  categoryId: json['categoryId'] as String,
  categorySlug: json['categorySlug'] as String,
  categoryName: json['categoryName'] as String,
  totalViews: (json['totalViews'] as num).toInt(),
  totalListens: (json['totalListens'] as num).toInt(),
);

Map<String, dynamic> _$TopItemToJson(_TopItem instance) => <String, dynamic>{
  'itemId': instance.itemId,
  'itemSlug': instance.itemSlug,
  'itemName': instance.itemName,
  'categoryId': instance.categoryId,
  'categorySlug': instance.categorySlug,
  'categoryName': instance.categoryName,
  'totalViews': instance.totalViews,
  'totalListens': instance.totalListens,
};

_DauPoint _$DauPointFromJson(Map<String, dynamic> json) => _DauPoint(
  day: json['day'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$DauPointToJson(_DauPoint instance) => <String, dynamic>{
  'day': instance.day,
  'count': instance.count,
};

_ActiveUsers _$ActiveUsersFromJson(Map<String, dynamic> json) => _ActiveUsers(
  windowDays: (json['windowDays'] as num).toInt(),
  dau: (json['dau'] as num).toInt(),
  wau: (json['wau'] as num).toInt(),
  mau: (json['mau'] as num).toInt(),
  series: (json['series'] as List<dynamic>)
      .map((e) => DauPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ActiveUsersToJson(_ActiveUsers instance) =>
    <String, dynamic>{
      'windowDays': instance.windowDays,
      'dau': instance.dau,
      'wau': instance.wau,
      'mau': instance.mau,
      'series': instance.series,
    };
