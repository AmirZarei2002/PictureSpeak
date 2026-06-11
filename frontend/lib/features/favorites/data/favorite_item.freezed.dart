// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteItem {

 String get itemId; String get itemSlug; String get itemName; String get imagePath; String? get thumbnailPath; String? get audioPath; String get categoryId; String get categorySlug; String get categoryName; String get categoryColorHex; DateTime get favoritedAt;
/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteItemCopyWith<FavoriteItem> get copyWith => _$FavoriteItemCopyWithImpl<FavoriteItem>(this as FavoriteItem, _$identity);

  /// Serializes this FavoriteItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemSlug, itemSlug) || other.itemSlug == itemSlug)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryColorHex, categoryColorHex) || other.categoryColorHex == categoryColorHex)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemSlug,itemName,imagePath,thumbnailPath,audioPath,categoryId,categorySlug,categoryName,categoryColorHex,favoritedAt);

@override
String toString() {
  return 'FavoriteItem(itemId: $itemId, itemSlug: $itemSlug, itemName: $itemName, imagePath: $imagePath, thumbnailPath: $thumbnailPath, audioPath: $audioPath, categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, categoryColorHex: $categoryColorHex, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteItemCopyWith<$Res>  {
  factory $FavoriteItemCopyWith(FavoriteItem value, $Res Function(FavoriteItem) _then) = _$FavoriteItemCopyWithImpl;
@useResult
$Res call({
 String itemId, String itemSlug, String itemName, String imagePath, String? thumbnailPath, String? audioPath, String categoryId, String categorySlug, String categoryName, String categoryColorHex, DateTime favoritedAt
});




}
/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._self, this._then);

  final FavoriteItem _self;
  final $Res Function(FavoriteItem) _then;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? itemSlug = null,Object? itemName = null,Object? imagePath = null,Object? thumbnailPath = freezed,Object? audioPath = freezed,Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? categoryColorHex = null,Object? favoritedAt = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemSlug: null == itemSlug ? _self.itemSlug : itemSlug // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,categoryColorHex: null == categoryColorHex ? _self.categoryColorHex : categoryColorHex // ignore: cast_nullable_to_non_nullable
as String,favoritedAt: null == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteItem].
extension FavoriteItemPatterns on FavoriteItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteItem value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteItem value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String itemSlug,  String itemName,  String imagePath,  String? thumbnailPath,  String? audioPath,  String categoryId,  String categorySlug,  String categoryName,  String categoryColorHex,  DateTime favoritedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.imagePath,_that.thumbnailPath,_that.audioPath,_that.categoryId,_that.categorySlug,_that.categoryName,_that.categoryColorHex,_that.favoritedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String itemSlug,  String itemName,  String imagePath,  String? thumbnailPath,  String? audioPath,  String categoryId,  String categorySlug,  String categoryName,  String categoryColorHex,  DateTime favoritedAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteItem():
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.imagePath,_that.thumbnailPath,_that.audioPath,_that.categoryId,_that.categorySlug,_that.categoryName,_that.categoryColorHex,_that.favoritedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String itemSlug,  String itemName,  String imagePath,  String? thumbnailPath,  String? audioPath,  String categoryId,  String categorySlug,  String categoryName,  String categoryColorHex,  DateTime favoritedAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.imagePath,_that.thumbnailPath,_that.audioPath,_that.categoryId,_that.categorySlug,_that.categoryName,_that.categoryColorHex,_that.favoritedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteItem extends FavoriteItem {
  const _FavoriteItem({required this.itemId, required this.itemSlug, required this.itemName, required this.imagePath, this.thumbnailPath, this.audioPath, required this.categoryId, required this.categorySlug, required this.categoryName, required this.categoryColorHex, required this.favoritedAt}): super._();
  factory _FavoriteItem.fromJson(Map<String, dynamic> json) => _$FavoriteItemFromJson(json);

@override final  String itemId;
@override final  String itemSlug;
@override final  String itemName;
@override final  String imagePath;
@override final  String? thumbnailPath;
@override final  String? audioPath;
@override final  String categoryId;
@override final  String categorySlug;
@override final  String categoryName;
@override final  String categoryColorHex;
@override final  DateTime favoritedAt;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteItemCopyWith<_FavoriteItem> get copyWith => __$FavoriteItemCopyWithImpl<_FavoriteItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemSlug, itemSlug) || other.itemSlug == itemSlug)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.thumbnailPath, thumbnailPath) || other.thumbnailPath == thumbnailPath)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryColorHex, categoryColorHex) || other.categoryColorHex == categoryColorHex)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemSlug,itemName,imagePath,thumbnailPath,audioPath,categoryId,categorySlug,categoryName,categoryColorHex,favoritedAt);

@override
String toString() {
  return 'FavoriteItem(itemId: $itemId, itemSlug: $itemSlug, itemName: $itemName, imagePath: $imagePath, thumbnailPath: $thumbnailPath, audioPath: $audioPath, categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, categoryColorHex: $categoryColorHex, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteItemCopyWith<$Res> implements $FavoriteItemCopyWith<$Res> {
  factory _$FavoriteItemCopyWith(_FavoriteItem value, $Res Function(_FavoriteItem) _then) = __$FavoriteItemCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String itemSlug, String itemName, String imagePath, String? thumbnailPath, String? audioPath, String categoryId, String categorySlug, String categoryName, String categoryColorHex, DateTime favoritedAt
});




}
/// @nodoc
class __$FavoriteItemCopyWithImpl<$Res>
    implements _$FavoriteItemCopyWith<$Res> {
  __$FavoriteItemCopyWithImpl(this._self, this._then);

  final _FavoriteItem _self;
  final $Res Function(_FavoriteItem) _then;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? itemSlug = null,Object? itemName = null,Object? imagePath = null,Object? thumbnailPath = freezed,Object? audioPath = freezed,Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? categoryColorHex = null,Object? favoritedAt = null,}) {
  return _then(_FavoriteItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemSlug: null == itemSlug ? _self.itemSlug : itemSlug // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,thumbnailPath: freezed == thumbnailPath ? _self.thumbnailPath : thumbnailPath // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,categoryColorHex: null == categoryColorHex ? _self.categoryColorHex : categoryColorHex // ignore: cast_nullable_to_non_nullable
as String,favoritedAt: null == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
