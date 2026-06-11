// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminCategory {

 String get id; String get slug; String get name; String get coverImagePath; String get colorHex; int get sortOrder; bool get isActive; int get itemCount;
/// Create a copy of AdminCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminCategoryCopyWith<AdminCategory> get copyWith => _$AdminCategoryCopyWithImpl<AdminCategory>(this as AdminCategory, _$identity);

  /// Serializes this AdminCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImagePath, coverImagePath) || other.coverImagePath == coverImagePath)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,coverImagePath,colorHex,sortOrder,isActive,itemCount);

@override
String toString() {
  return 'AdminCategory(id: $id, slug: $slug, name: $name, coverImagePath: $coverImagePath, colorHex: $colorHex, sortOrder: $sortOrder, isActive: $isActive, itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class $AdminCategoryCopyWith<$Res>  {
  factory $AdminCategoryCopyWith(AdminCategory value, $Res Function(AdminCategory) _then) = _$AdminCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String name, String coverImagePath, String colorHex, int sortOrder, bool isActive, int itemCount
});




}
/// @nodoc
class _$AdminCategoryCopyWithImpl<$Res>
    implements $AdminCategoryCopyWith<$Res> {
  _$AdminCategoryCopyWithImpl(this._self, this._then);

  final AdminCategory _self;
  final $Res Function(AdminCategory) _then;

/// Create a copy of AdminCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? coverImagePath = null,Object? colorHex = null,Object? sortOrder = null,Object? isActive = null,Object? itemCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImagePath: null == coverImagePath ? _self.coverImagePath : coverImagePath // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminCategory].
extension AdminCategoryPatterns on AdminCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminCategory value)  $default,){
final _that = this;
switch (_that) {
case _AdminCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminCategory value)?  $default,){
final _that = this;
switch (_that) {
case _AdminCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String coverImagePath,  String colorHex,  int sortOrder,  bool isActive,  int itemCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminCategory() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.coverImagePath,_that.colorHex,_that.sortOrder,_that.isActive,_that.itemCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String name,  String coverImagePath,  String colorHex,  int sortOrder,  bool isActive,  int itemCount)  $default,) {final _that = this;
switch (_that) {
case _AdminCategory():
return $default(_that.id,_that.slug,_that.name,_that.coverImagePath,_that.colorHex,_that.sortOrder,_that.isActive,_that.itemCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String name,  String coverImagePath,  String colorHex,  int sortOrder,  bool isActive,  int itemCount)?  $default,) {final _that = this;
switch (_that) {
case _AdminCategory() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.coverImagePath,_that.colorHex,_that.sortOrder,_that.isActive,_that.itemCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminCategory implements AdminCategory {
  const _AdminCategory({required this.id, required this.slug, required this.name, required this.coverImagePath, required this.colorHex, required this.sortOrder, required this.isActive, this.itemCount = 0});
  factory _AdminCategory.fromJson(Map<String, dynamic> json) => _$AdminCategoryFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String name;
@override final  String coverImagePath;
@override final  String colorHex;
@override final  int sortOrder;
@override final  bool isActive;
@override@JsonKey() final  int itemCount;

/// Create a copy of AdminCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminCategoryCopyWith<_AdminCategory> get copyWith => __$AdminCategoryCopyWithImpl<_AdminCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImagePath, coverImagePath) || other.coverImagePath == coverImagePath)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,coverImagePath,colorHex,sortOrder,isActive,itemCount);

@override
String toString() {
  return 'AdminCategory(id: $id, slug: $slug, name: $name, coverImagePath: $coverImagePath, colorHex: $colorHex, sortOrder: $sortOrder, isActive: $isActive, itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class _$AdminCategoryCopyWith<$Res> implements $AdminCategoryCopyWith<$Res> {
  factory _$AdminCategoryCopyWith(_AdminCategory value, $Res Function(_AdminCategory) _then) = __$AdminCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String name, String coverImagePath, String colorHex, int sortOrder, bool isActive, int itemCount
});




}
/// @nodoc
class __$AdminCategoryCopyWithImpl<$Res>
    implements _$AdminCategoryCopyWith<$Res> {
  __$AdminCategoryCopyWithImpl(this._self, this._then);

  final _AdminCategory _self;
  final $Res Function(_AdminCategory) _then;

/// Create a copy of AdminCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? coverImagePath = null,Object? colorHex = null,Object? sortOrder = null,Object? isActive = null,Object? itemCount = null,}) {
  return _then(_AdminCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImagePath: null == coverImagePath ? _self.coverImagePath : coverImagePath // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
