import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_item.freezed.dart';
part 'learning_item.g.dart';

@freezed
abstract class LearningItem with _$LearningItem {
  const factory LearningItem({
    required String id,
    required String slug,
    required String name,
    required String imagePath, 
    String? thumbnailPath, 
    String? audioPath, 
  }) = _LearningItem;

  factory LearningItem.fromJson(Map<String, dynamic> json) =>
      _$LearningItemFromJson(json);
}
