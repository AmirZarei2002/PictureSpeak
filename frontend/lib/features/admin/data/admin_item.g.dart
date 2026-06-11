// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminItem _$AdminItemFromJson(Map<String, dynamic> json) => _AdminItem(
  id: json['id'] as String,
  categoryId: json['categoryId'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  imagePath: json['imagePath'] as String,
  thumbnailPath: json['thumbnailPath'] as String?,
  audioPath: json['audioPath'] as String?,
  sortOrder: (json['sortOrder'] as num).toInt(),
  isActive: json['isActive'] as bool,
);

Map<String, dynamic> _$AdminItemToJson(_AdminItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'slug': instance.slug,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'thumbnailPath': instance.thumbnailPath,
      'audioPath': instance.audioPath,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
    };
