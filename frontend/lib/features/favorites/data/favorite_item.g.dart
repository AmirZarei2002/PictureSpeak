// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) =>
    _FavoriteItem(
      itemId: json['itemId'] as String,
      itemSlug: json['itemSlug'] as String,
      itemName: json['itemName'] as String,
      imagePath: json['imagePath'] as String,
      thumbnailPath: json['thumbnailPath'] as String?,
      audioPath: json['audioPath'] as String?,
      categoryId: json['categoryId'] as String,
      categorySlug: json['categorySlug'] as String,
      categoryName: json['categoryName'] as String,
      categoryColorHex: json['categoryColorHex'] as String,
      favoritedAt: DateTime.parse(json['favoritedAt'] as String),
    );

Map<String, dynamic> _$FavoriteItemToJson(_FavoriteItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemSlug': instance.itemSlug,
      'itemName': instance.itemName,
      'imagePath': instance.imagePath,
      'thumbnailPath': instance.thumbnailPath,
      'audioPath': instance.audioPath,
      'categoryId': instance.categoryId,
      'categorySlug': instance.categorySlug,
      'categoryName': instance.categoryName,
      'categoryColorHex': instance.categoryColorHex,
      'favoritedAt': instance.favoritedAt.toIso8601String(),
    };
