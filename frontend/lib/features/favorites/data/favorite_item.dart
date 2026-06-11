import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:frontend/features/categories/data/learning_item.dart';

part 'favorite_item.freezed.dart';
part 'favorite_item.g.dart';

@freezed
abstract class FavoriteItem with _$FavoriteItem {
  const FavoriteItem._(); 

  const factory FavoriteItem({
    required String itemId,
    required String itemSlug,
    required String itemName,
    required String imagePath,
    String? thumbnailPath,
    String? audioPath,
    required String categoryId,
    required String categorySlug,
    required String categoryName,
    required String categoryColorHex,
    required DateTime favoritedAt,
  }) = _FavoriteItem;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);

  LearningItem toLearningItem() => LearningItem(
    id: itemId,
    slug: itemSlug,
    name: itemName,
    imagePath: imagePath,
    thumbnailPath: thumbnailPath,
    audioPath: audioPath,
  );
}
