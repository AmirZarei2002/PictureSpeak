// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryProgress _$CategoryProgressFromJson(Map<String, dynamic> json) =>
    _CategoryProgress(
      categoryId: json['categoryId'] as String,
      categorySlug: json['categorySlug'] as String,
      categoryName: json['categoryName'] as String,
      explored: (json['explored'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryProgressToJson(_CategoryProgress instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categorySlug': instance.categorySlug,
      'categoryName': instance.categoryName,
      'explored': instance.explored,
      'total': instance.total,
    };

_ProgressSummary _$ProgressSummaryFromJson(Map<String, dynamic> json) =>
    _ProgressSummary(
      totalViews: (json['totalViews'] as num).toInt(),
      totalListens: (json['totalListens'] as num).toInt(),
      itemsExplored: (json['itemsExplored'] as num).toInt(),
      byCategory: (json['byCategory'] as List<dynamic>)
          .map((e) => CategoryProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProgressSummaryToJson(_ProgressSummary instance) =>
    <String, dynamic>{
      'totalViews': instance.totalViews,
      'totalListens': instance.totalListens,
      'itemsExplored': instance.itemsExplored,
      'byCategory': instance.byCategory,
    };
