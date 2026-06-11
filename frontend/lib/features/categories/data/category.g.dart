// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  slug: json['slug'] as String,
  name: json['name'] as String,
  coverImagePath: json['coverImagePath'] as String,
  colorHex: json['colorHex'] as String,
  itemCount: (json['itemCount'] as num).toInt(),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'coverImagePath': instance.coverImagePath,
  'colorHex': instance.colorHex,
  'itemCount': instance.itemCount,
};
