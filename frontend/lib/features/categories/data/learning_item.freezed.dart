// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningItem {

 String get id; String get slug; String get name; String get imagePath; String? get thumbnailPath; String? get audioPath;
/// Create a copy of LearningItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningItemCopyWith<LearningItem> get copyWith => _$LearningItemCopyWithImpl<LearningItem>(this as LearningItem, _$identity);

  /// Serializes this LearningItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningItem&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,imagePath,thumbnailPath,audioPath);

@override
String toString() {
  return 'LearningItem(id: $id, slug: $slug, name: $name, imagePath: $imagePath, thumbnailPath: $thumbnailPath, audioPath: $audioPath)';
}


}

/// @nodoc
abstract mixin class $LearningItemCopyWith<$Res>  {
  factory $LearningItemCopyWith(LearningItem value, $Res Function(LearningItem) _then) = _$LearningItemCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String imagePath, String? thumbnailPath, String? audioPath
});




}
/// @nodoc
class _$LearningItemCopyWithImpl<$Res>
    implements $LearningItemCopyWith<$Res> {
  _$LearningItemCopyWithImpl(this._self, this._then);

  final LearningItem _self;
  final $Res Function(LearningItem) _then;

/// Create a copy of LearningItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? imagePath = null,Object? thumbnailPath = freezed,Object? audioPath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningItem].
extension LearningItemPatterns on LearningItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningItem value)  $default,){
final _that = this;
switch (_that) {
case _LearningItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningItem value)?  $default,){
final _that = this;
switch (_that) {
case _LearningItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String imagePath,  String? thumbnailPath,  String? audioPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningItem() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.imagePath,_that.thumbnailPath,_that.audioPath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String imagePath,  String? thumbnailPath,  String? audioPath)  $default,) {final _that = this;
switch (_that) {
case _LearningItem():
return $default(_that.id,_that.slug,_that.name,_that.imagePath,_that.thumbnailPath,_that.audioPath);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String imagePath,  String? thumbnailPath,  String? audioPath)?  $default,) {final _that = this;
switch (_that) {
case _LearningItem() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.imagePath,_that.thumbnailPath,_that.audioPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningItem implements LearningItem {
  const _LearningItem({required this.id, required this.slug, required this.name, required this.imagePath, this.thumbnailPath, this.audioPath});
  factory _LearningItem.fromJson(Map<String, dynamic> json) => _$LearningItemFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  String imagePath;
@override final  String? thumbnailPath;
@override final  String? audioPath;

/// Create a copy of LearningItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningItemCopyWith<_LearningItem> get copyWith => __$LearningItemCopyWithImpl<_LearningItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningItem&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,imagePath,thumbnailPath,audioPath);

@override
String toString() {
  return 'LearningItem(id: $id, slug: $slug, name: $name, imagePath: $imagePath, thumbnailPath: $thumbnailPath, audioPath: $audioPath)';
}


}

/// @nodoc
abstract mixin class _$LearningItemCopyWith<$Res> implements $LearningItemCopyWith<$Res> {
  factory _$LearningItemCopyWith(_LearningItem value, $Res Function(_LearningItem) _then) = __$LearningItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String imagePath, String? thumbnailPath, String? audioPath
});




}
/// @nodoc
class __$LearningItemCopyWithImpl<$Res>
    implements _$LearningItemCopyWith<$Res> {
  __$LearningItemCopyWithImpl(this._self, this._then);

  final _LearningItem _self;
  final $Res Function(_LearningItem) _then;

/// Create a copy of LearningItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? imagePath = null,Object? thumbnailPath = freezed,Object? audioPath = freezed,}) {
  return _then(_LearningItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
