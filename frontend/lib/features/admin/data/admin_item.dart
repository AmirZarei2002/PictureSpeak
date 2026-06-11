import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_item.freezed.dart';
part 'admin_item.g.dart';

@freezed
abstract class AdminItem with _$AdminItem {
  const factory AdminItem({
    required String id,
    required String categoryId,
    required String slug,
    required String name,
    required String imagePath,
    String? thumbnailPath,
    String? audioPath,
    required int sortOrder,
    required bool isActive,
  }) = _AdminItem;

  factory AdminItem.fromJson(Map<String, dynamic> json) =>
      _$AdminItemFromJson(json);
}
