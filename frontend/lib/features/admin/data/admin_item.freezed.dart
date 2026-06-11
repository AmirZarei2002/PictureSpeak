// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminItem {

 String get id; String get categoryId; String get slug; String get name; String get imagePath; String? get thumbnailPath; String? get audioPath; int get sortOrder; bool get isActive;
/// Create a copy of AdminItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminItemCopyWith<AdminItem> get copyWith => _$AdminItemCopyWithImpl<AdminItem>(this as AdminItem, _$identity);

  /// Serializes this AdminItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminItem&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,slug,name,imagePath,thumbnailPath,audioPath,sortOrder,isActive);

@override
String toString() {
  return 'AdminItem(id: $id, categoryId: $categoryId, slug: $slug, name: $name, imagePath: $imagePath, thumbnailPath: $thumbnailPath, audioPath: $audioPath, sortOrder: $sortOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $AdminItemCopyWith<$Res>  {
  factory $AdminItemCopyWith(AdminItem value, $Res Function(AdminItem) _then) = _$AdminItemCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, String slug, String name, String imagePath, String? thumbnailPath, String? audioPath, int sortOrder, bool isActive
});




}
/// @nodoc
class _$AdminItemCopyWithImpl<$Res>
    implements $AdminItemCopyWith<$Res> {
  _$AdminItemCopyWithImpl(this._self, this._then);

  final AdminItem _self;
  final $Res Function(AdminItem) _then;

/// Create a copy of AdminItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? slug = null,Object? name = null,Object? imagePath = null,Object? thumbnailPath = freezed,Object? audioPath = freezed,Object? sortOrder = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminItem].
extension AdminItemPatterns on AdminItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminItem value)  $default,){
final _that = this;
switch (_that) {
case _AdminItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminItem value)?  $default,){
final _that = this;
switch (_that) {
case _AdminItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String categoryId,  String slug,  String name,  String imagePath,  String? thumbnailPath,  String? audioPath,  int sortOrder,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminItem() when $default != null:
return $default(_that.id,_that.categoryId,_that.slug,_that.name,_that.imagePath,_that.thumbnailPath,_that.audioPath,_that.sortOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String categoryId,  String slug,  String name,  String imagePath,  String? thumbnailPath,  String? audioPath,  int sortOrder,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _AdminItem():
return $default(_that.id,_that.categoryId,_that.slug,_that.name,_that.imagePath,_that.thumbnailPath,_that.audioPath,_that.sortOrder,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String categoryId,  String slug,  String name,  String imagePath,  String? thumbnailPath,  String? audioPath,  int sortOrder,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _AdminItem() when $default != null:
return $default(_that.id,_that.categoryId,_that.slug,_that.name,_that.imagePath,_that.thumbnailPath,_that.audioPath,_that.sortOrder,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminItem implements AdminItem {
  const _AdminItem({required this.id, required this.categoryId, required this.slug, required this.name, required this.imagePath, this.thumbnailPath, this.audioPath, required this.sortOrder, required this.isActive});
  factory _AdminItem.fromJson(Map<String, dynamic> json) => _$AdminItemFromJson(json);

@override final  String id;
@override final  String categoryId;
@override final  String slug;
@override final  String name;
@override final  String imagePath;
@override final  String? thumbnailPath;
@override final  String? audioPath;
@override final  int sortOrder;
@override final  bool isActive;

/// Create a copy of AdminItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminItemCopyWith<_AdminItem> get copyWith => __$AdminItemCopyWithImpl<_AdminItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminItem&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,slug,name,imagePath,thumbnailPath,audioPath,sortOrder,isActive);

@override
String toString() {
  return 'AdminItem(id: $id, categoryId: $categoryId, slug: $slug, name: $name, imagePath: $imagePath, thumbnailPath: $thumbnailPath, audioPath: $audioPath, sortOrder: $sortOrder, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$AdminItemCopyWith<$Res> implements $AdminItemCopyWith<$Res> {
  factory _$AdminItemCopyWith(_AdminItem value, $Res Function(_AdminItem) _then) = __$AdminItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, String slug, String name, String imagePath, String? thumbnailPath, String? audioPath, int sortOrder, bool isActive
});




}
/// @nodoc
class __$AdminItemCopyWithImpl<$Res>
    implements _$AdminItemCopyWith<$Res> {
  __$AdminItemCopyWithImpl(this._self, this._then);

  final _AdminItem _self;
  final $Res Function(_AdminItem) _then;

/// Create a copy of AdminItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? slug = null,Object? name = null,Object? imagePath = null,Object? thumbnailPath = freezed,Object? audioPath = freezed,Object? sortOrder = null,Object? isActive = null,}) {
  return _then(_AdminItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
