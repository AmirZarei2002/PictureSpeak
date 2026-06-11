// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminCategory _$AdminCategoryFromJson(Map<String, dynamic> json) =>
    _AdminCategory(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      coverImagePath: json['coverImagePath'] as String,
      colorHex: json['colorHex'] as String,
      sortOrder: (json['sortOrder'] as num).toInt(),
      isActive: json['isActive'] as bool,
      itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AdminCategoryToJson(_AdminCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'coverImagePath': instance.coverImagePath,
      'colorHex': instance.colorHex,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
      'itemCount': instance.itemCount,
    };
