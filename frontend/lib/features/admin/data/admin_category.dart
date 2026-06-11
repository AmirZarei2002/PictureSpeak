import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_category.freezed.dart';
part 'admin_category.g.dart';

@freezed
abstract class AdminCategory with _$AdminCategory {
  const factory AdminCategory({
    required String id,
    required String slug,
    required String name,
    required String coverImagePath,
    required String colorHex,
    required int sortOrder,
    required bool isActive,
    @Default(0) int itemCount,
  }) = _AdminCategory;

  factory AdminCategory.fromJson(Map<String, dynamic> json) =>
      _$AdminCategoryFromJson(json);
}
