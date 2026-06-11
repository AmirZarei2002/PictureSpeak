// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LearningItem _$LearningItemFromJson(Map<String, dynamic> json) =>
    _LearningItem(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      thumbnailPath: json['thumbnailPath'] as String?,
      audioPath: json['audioPath'] as String?,
    );

Map<String, dynamic> _$LearningItemToJson(_LearningItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'thumbnailPath': instance.thumbnailPath,
      'audioPath': instance.audioPath,
    };
