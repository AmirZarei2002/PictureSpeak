import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics.freezed.dart';
part 'analytics.g.dart';

@freezed
abstract class AnalyticsOverview with _$AnalyticsOverview {
  const factory AnalyticsOverview({
    required int totalUsers,
    required int guestUsers,
    required int registeredUsers,
    required int totalAdmins,
    required int totalCategories,
    required int activeCategories,
    required int totalItems,
    required int activeItems,
    required int totalFavorites,
    required int totalProgressRows,
  }) = _AnalyticsOverview;

  factory AnalyticsOverview.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsOverviewFromJson(json);
}

@freezed
abstract class TopItem with _$TopItem {
  const factory TopItem({
    required String itemId,
    required String itemSlug,
    required String itemName,
    required String categoryId,
    required String categorySlug,
    required String categoryName,
    required int totalViews,
    required int totalListens,
  }) = _TopItem;

  factory TopItem.fromJson(Map<String, dynamic> json) =>
      _$TopItemFromJson(json);
}

@freezed
abstract class TopCategory with _$TopCategory {
  const factory TopCategory({
    required String categoryId,
    required String categorySlug,
    required String categoryName,
    required String colorHex,
    required int favoriteCount,
  }) = _TopCategory;

  factory TopCategory.fromJson(Map<String, dynamic> json) =>
      _$TopCategoryFromJson(json);
}

@freezed
abstract class DauPoint with _$DauPoint {
  const factory DauPoint({
    required String day, 
    required int count,
  }) = _DauPoint;

  factory DauPoint.fromJson(Map<String, dynamic> json) =>
      _$DauPointFromJson(json);
}

@freezed
abstract class ActiveUsers with _$ActiveUsers {
  const factory ActiveUsers({
    required int windowDays,
    required int dau,
    required int wau,
    required int mau,
    required List<DauPoint> series,
  }) = _ActiveUsers;

  factory ActiveUsers.fromJson(Map<String, dynamic> json) =>
      _$ActiveUsersFromJson(json);
}
