import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_summary.freezed.dart';
part 'progress_summary.g.dart';

@freezed
abstract class CategoryProgress with _$CategoryProgress {
  const factory CategoryProgress({
    required String categoryId,
    required String categorySlug,
    required String categoryName,
    required int explored,
    required int total,
  }) = _CategoryProgress;

  factory CategoryProgress.fromJson(Map<String, dynamic> json) =>
      _$CategoryProgressFromJson(json);
}

@freezed
abstract class ProgressSummary with _$ProgressSummary {
  const factory ProgressSummary({
    required int totalViews,
    required int totalListens,
    required int itemsExplored,
    required List<CategoryProgress> byCategory,
  }) = _ProgressSummary;

  factory ProgressSummary.fromJson(Map<String, dynamic> json) =>
      _$ProgressSummaryFromJson(json);
}
