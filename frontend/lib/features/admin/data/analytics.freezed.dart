// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsOverview {

 int get totalUsers; int get guestUsers; int get registeredUsers; int get totalAdmins; int get totalCategories; int get activeCategories; int get totalItems; int get activeItems; int get totalFavorites; int get totalProgressRows;
/// Create a copy of AnalyticsOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsOverviewCopyWith<AnalyticsOverview> get copyWith => _$AnalyticsOverviewCopyWithImpl<AnalyticsOverview>(this as AnalyticsOverview, _$identity);

  /// Serializes this AnalyticsOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsOverview&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.guestUsers, guestUsers) || other.guestUsers == guestUsers)&&(identical(other.registeredUsers, registeredUsers) || other.registeredUsers == registeredUsers)&&(identical(other.totalAdmins, totalAdmins) || other.totalAdmins == totalAdmins)&&(identical(other.totalCategories, totalCategories) || other.totalCategories == totalCategories)&&(identical(other.activeCategories, activeCategories) || other.activeCategories == activeCategories)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.activeItems, activeItems) || other.activeItems == activeItems)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.totalProgressRows, totalProgressRows) || other.totalProgressRows == totalProgressRows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalUsers,guestUsers,registeredUsers,totalAdmins,totalCategories,activeCategories,totalItems,activeItems,totalFavorites,totalProgressRows);

@override
String toString() {
  return 'AnalyticsOverview(totalUsers: $totalUsers, guestUsers: $guestUsers, registeredUsers: $registeredUsers, totalAdmins: $totalAdmins, totalCategories: $totalCategories, activeCategories: $activeCategories, totalItems: $totalItems, activeItems: $activeItems, totalFavorites: $totalFavorites, totalProgressRows: $totalProgressRows)';
}


}

/// @nodoc
abstract mixin class $AnalyticsOverviewCopyWith<$Res>  {
  factory $AnalyticsOverviewCopyWith(AnalyticsOverview value, $Res Function(AnalyticsOverview) _then) = _$AnalyticsOverviewCopyWithImpl;
@useResult
$Res call({
 int totalUsers, int guestUsers, int registeredUsers, int totalAdmins, int totalCategories, int activeCategories, int totalItems, int activeItems, int totalFavorites, int totalProgressRows
});




}
/// @nodoc
class _$AnalyticsOverviewCopyWithImpl<$Res>
    implements $AnalyticsOverviewCopyWith<$Res> {
  _$AnalyticsOverviewCopyWithImpl(this._self, this._then);

  final AnalyticsOverview _self;
  final $Res Function(AnalyticsOverview) _then;

/// Create a copy of AnalyticsOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalUsers = null,Object? guestUsers = null,Object? registeredUsers = null,Object? totalAdmins = null,Object? totalCategories = null,Object? activeCategories = null,Object? totalItems = null,Object? activeItems = null,Object? totalFavorites = null,Object? totalProgressRows = null,}) {
  return _then(_self.copyWith(
totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,guestUsers: null == guestUsers ? _self.guestUsers : guestUsers // ignore: cast_nullable_to_non_nullable
as int,registeredUsers: null == registeredUsers ? _self.registeredUsers : registeredUsers // ignore: cast_nullable_to_non_nullable
as int,totalAdmins: null == totalAdmins ? _self.totalAdmins : totalAdmins // ignore: cast_nullable_to_non_nullable
as int,totalCategories: null == totalCategories ? _self.totalCategories : totalCategories // ignore: cast_nullable_to_non_nullable
as int,activeCategories: null == activeCategories ? _self.activeCategories : activeCategories // ignore: cast_nullable_to_non_nullable
as int,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,activeItems: null == activeItems ? _self.activeItems : activeItems // ignore: cast_nullable_to_non_nullable
as int,totalFavorites: null == totalFavorites ? _self.totalFavorites : totalFavorites // ignore: cast_nullable_to_non_nullable
as int,totalProgressRows: null == totalProgressRows ? _self.totalProgressRows : totalProgressRows // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsOverview].
extension AnalyticsOverviewPatterns on AnalyticsOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsOverview value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsOverview value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalUsers,  int guestUsers,  int registeredUsers,  int totalAdmins,  int totalCategories,  int activeCategories,  int totalItems,  int activeItems,  int totalFavorites,  int totalProgressRows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsOverview() when $default != null:
return $default(_that.totalUsers,_that.guestUsers,_that.registeredUsers,_that.totalAdmins,_that.totalCategories,_that.activeCategories,_that.totalItems,_that.activeItems,_that.totalFavorites,_that.totalProgressRows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalUsers,  int guestUsers,  int registeredUsers,  int totalAdmins,  int totalCategories,  int activeCategories,  int totalItems,  int activeItems,  int totalFavorites,  int totalProgressRows)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsOverview():
return $default(_that.totalUsers,_that.guestUsers,_that.registeredUsers,_that.totalAdmins,_that.totalCategories,_that.activeCategories,_that.totalItems,_that.activeItems,_that.totalFavorites,_that.totalProgressRows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalUsers,  int guestUsers,  int registeredUsers,  int totalAdmins,  int totalCategories,  int activeCategories,  int totalItems,  int activeItems,  int totalFavorites,  int totalProgressRows)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsOverview() when $default != null:
return $default(_that.totalUsers,_that.guestUsers,_that.registeredUsers,_that.totalAdmins,_that.totalCategories,_that.activeCategories,_that.totalItems,_that.activeItems,_that.totalFavorites,_that.totalProgressRows);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsOverview implements AnalyticsOverview {
  const _AnalyticsOverview({required this.totalUsers, required this.guestUsers, required this.registeredUsers, required this.totalAdmins, required this.totalCategories, required this.activeCategories, required this.totalItems, required this.activeItems, required this.totalFavorites, required this.totalProgressRows});
  factory _AnalyticsOverview.fromJson(Map<String, dynamic> json) => _$AnalyticsOverviewFromJson(json);

@override final  int totalUsers;
@override final  int guestUsers;
@override final  int registeredUsers;
@override final  int totalAdmins;
@override final  int totalCategories;
@override final  int activeCategories;
@override final  int totalItems;
@override final  int activeItems;
@override final  int totalFavorites;
@override final  int totalProgressRows;

/// Create a copy of AnalyticsOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsOverviewCopyWith<_AnalyticsOverview> get copyWith => __$AnalyticsOverviewCopyWithImpl<_AnalyticsOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsOverview&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers)&&(identical(other.guestUsers, guestUsers) || other.guestUsers == guestUsers)&&(identical(other.registeredUsers, registeredUsers) || other.registeredUsers == registeredUsers)&&(identical(other.totalAdmins, totalAdmins) || other.totalAdmins == totalAdmins)&&(identical(other.totalCategories, totalCategories) || other.totalCategories == totalCategories)&&(identical(other.activeCategories, activeCategories) || other.activeCategories == activeCategories)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.activeItems, activeItems) || other.activeItems == activeItems)&&(identical(other.totalFavorites, totalFavorites) || other.totalFavorites == totalFavorites)&&(identical(other.totalProgressRows, totalProgressRows) || other.totalProgressRows == totalProgressRows));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalUsers,guestUsers,registeredUsers,totalAdmins,totalCategories,activeCategories,totalItems,activeItems,totalFavorites,totalProgressRows);

@override
String toString() {
  return 'AnalyticsOverview(totalUsers: $totalUsers, guestUsers: $guestUsers, registeredUsers: $registeredUsers, totalAdmins: $totalAdmins, totalCategories: $totalCategories, activeCategories: $activeCategories, totalItems: $totalItems, activeItems: $activeItems, totalFavorites: $totalFavorites, totalProgressRows: $totalProgressRows)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsOverviewCopyWith<$Res> implements $AnalyticsOverviewCopyWith<$Res> {
  factory _$AnalyticsOverviewCopyWith(_AnalyticsOverview value, $Res Function(_AnalyticsOverview) _then) = __$AnalyticsOverviewCopyWithImpl;
@override @useResult
$Res call({
 int totalUsers, int guestUsers, int registeredUsers, int totalAdmins, int totalCategories, int activeCategories, int totalItems, int activeItems, int totalFavorites, int totalProgressRows
});




}
/// @nodoc
class __$AnalyticsOverviewCopyWithImpl<$Res>
    implements _$AnalyticsOverviewCopyWith<$Res> {
  __$AnalyticsOverviewCopyWithImpl(this._self, this._then);

  final _AnalyticsOverview _self;
  final $Res Function(_AnalyticsOverview) _then;

/// Create a copy of AnalyticsOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalUsers = null,Object? guestUsers = null,Object? registeredUsers = null,Object? totalAdmins = null,Object? totalCategories = null,Object? activeCategories = null,Object? totalItems = null,Object? activeItems = null,Object? totalFavorites = null,Object? totalProgressRows = null,}) {
  return _then(_AnalyticsOverview(
totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,guestUsers: null == guestUsers ? _self.guestUsers : guestUsers // ignore: cast_nullable_to_non_nullable
as int,registeredUsers: null == registeredUsers ? _self.registeredUsers : registeredUsers // ignore: cast_nullable_to_non_nullable
as int,totalAdmins: null == totalAdmins ? _self.totalAdmins : totalAdmins // ignore: cast_nullable_to_non_nullable
as int,totalCategories: null == totalCategories ? _self.totalCategories : totalCategories // ignore: cast_nullable_to_non_nullable
as int,activeCategories: null == activeCategories ? _self.activeCategories : activeCategories // ignore: cast_nullable_to_non_nullable
as int,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,activeItems: null == activeItems ? _self.activeItems : activeItems // ignore: cast_nullable_to_non_nullable
as int,totalFavorites: null == totalFavorites ? _self.totalFavorites : totalFavorites // ignore: cast_nullable_to_non_nullable
as int,totalProgressRows: null == totalProgressRows ? _self.totalProgressRows : totalProgressRows // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TopItem {

 String get itemId; String get itemSlug; String get itemName; String get categoryId; String get categorySlug; String get categoryName; int get totalViews; int get totalListens;
/// Create a copy of TopItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopItemCopyWith<TopItem> get copyWith => _$TopItemCopyWithImpl<TopItem>(this as TopItem, _$identity);

  /// Serializes this TopItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemSlug, itemSlug) || other.itemSlug == itemSlug)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalListens, totalListens) || other.totalListens == totalListens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemSlug,itemName,categoryId,categorySlug,categoryName,totalViews,totalListens);

@override
String toString() {
  return 'TopItem(itemId: $itemId, itemSlug: $itemSlug, itemName: $itemName, categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, totalViews: $totalViews, totalListens: $totalListens)';
}


}

/// @nodoc
abstract mixin class $TopItemCopyWith<$Res>  {
  factory $TopItemCopyWith(TopItem value, $Res Function(TopItem) _then) = _$TopItemCopyWithImpl;
@useResult
$Res call({
 String itemId, String itemSlug, String itemName, String categoryId, String categorySlug, String categoryName, int totalViews, int totalListens
});




}
/// @nodoc
class _$TopItemCopyWithImpl<$Res>
    implements $TopItemCopyWith<$Res> {
  _$TopItemCopyWithImpl(this._self, this._then);

  final TopItem _self;
  final $Res Function(TopItem) _then;

/// Create a copy of TopItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? itemSlug = null,Object? itemName = null,Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? totalViews = null,Object? totalListens = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemSlug: null == itemSlug ? _self.itemSlug : itemSlug // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalListens: null == totalListens ? _self.totalListens : totalListens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopItem].
extension TopItemPatterns on TopItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopItem value)  $default,){
final _that = this;
switch (_that) {
case _TopItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopItem value)?  $default,){
final _that = this;
switch (_that) {
case _TopItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String itemSlug,  String itemName,  String categoryId,  String categorySlug,  String categoryName,  int totalViews,  int totalListens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopItem() when $default != null:
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.categoryId,_that.categorySlug,_that.categoryName,_that.totalViews,_that.totalListens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String itemSlug,  String itemName,  String categoryId,  String categorySlug,  String categoryName,  int totalViews,  int totalListens)  $default,) {final _that = this;
switch (_that) {
case _TopItem():
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.categoryId,_that.categorySlug,_that.categoryName,_that.totalViews,_that.totalListens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String itemSlug,  String itemName,  String categoryId,  String categorySlug,  String categoryName,  int totalViews,  int totalListens)?  $default,) {final _that = this;
switch (_that) {
case _TopItem() when $default != null:
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.categoryId,_that.categorySlug,_that.categoryName,_that.totalViews,_that.totalListens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopItem implements TopItem {
  const _TopItem({required this.itemId, required this.itemSlug, required this.itemName, required this.categoryId, required this.categorySlug, required this.categoryName, required this.totalViews, required this.totalListens});
  factory _TopItem.fromJson(Map<String, dynamic> json) => _$TopItemFromJson(json);

@override final  String itemId;
@override final  String itemSlug;
@override final  String itemName;
@override final  String categoryId;
@override final  String categorySlug;
@override final  String categoryName;
@override final  int totalViews;
@override final  int totalListens;

/// Create a copy of TopItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopItemCopyWith<_TopItem> get copyWith => __$TopItemCopyWithImpl<_TopItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemSlug, itemSlug) || other.itemSlug == itemSlug)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalListens, totalListens) || other.totalListens == totalListens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemSlug,itemName,categoryId,categorySlug,categoryName,totalViews,totalListens);

@override
String toString() {
  return 'TopItem(itemId: $itemId, itemSlug: $itemSlug, itemName: $itemName, categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, totalViews: $totalViews, totalListens: $totalListens)';
}


}

/// @nodoc
abstract mixin class _$TopItemCopyWith<$Res> implements $TopItemCopyWith<$Res> {
  factory _$TopItemCopyWith(_TopItem value, $Res Function(_TopItem) _then) = __$TopItemCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String itemSlug, String itemName, String categoryId, String categorySlug, String categoryName, int totalViews, int totalListens
});




}
/// @nodoc
class __$TopItemCopyWithImpl<$Res>
    implements _$TopItemCopyWith<$Res> {
  __$TopItemCopyWithImpl(this._self, this._then);

  final _TopItem _self;
  final $Res Function(_TopItem) _then;

/// Create a copy of TopItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? itemSlug = null,Object? itemName = null,Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? totalViews = null,Object? totalListens = null,}) {
  return _then(_TopItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemSlug: null == itemSlug ? _self.itemSlug : itemSlug // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalListens: null == totalListens ? _self.totalListens : totalListens // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TopCategory {

 String get categoryId; String get categorySlug; String get categoryName; String get colorHex; int get favoriteCount;
/// Create a copy of TopCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopCategoryCopyWith<TopCategory> get copyWith => _$TopCategoryCopyWithImpl<TopCategory>(this as TopCategory, _$identity);

  /// Serializes this TopCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categorySlug,categoryName,colorHex,favoriteCount);

@override
String toString() {
  return 'TopCategory(categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, colorHex: $colorHex, favoriteCount: $favoriteCount)';
}


}

/// @nodoc
abstract mixin class $TopCategoryCopyWith<$Res>  {
  factory $TopCategoryCopyWith(TopCategory value, $Res Function(TopCategory) _then) = _$TopCategoryCopyWithImpl;
@useResult
$Res call({
 String categoryId, String categorySlug, String categoryName, String colorHex, int favoriteCount
});




}
/// @nodoc
class _$TopCategoryCopyWithImpl<$Res>
    implements $TopCategoryCopyWith<$Res> {
  _$TopCategoryCopyWithImpl(this._self, this._then);

  final TopCategory _self;
  final $Res Function(TopCategory) _then;

/// Create a copy of TopCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? colorHex = null,Object? favoriteCount = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopCategory].
extension TopCategoryPatterns on TopCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopCategory value)  $default,){
final _that = this;
switch (_that) {
case _TopCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopCategory value)?  $default,){
final _that = this;
switch (_that) {
case _TopCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String categoryId,  String categorySlug,  String categoryName,  String colorHex,  int favoriteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopCategory() when $default != null:
return $default(_that.categoryId,_that.categorySlug,_that.categoryName,_that.colorHex,_that.favoriteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String categoryId,  String categorySlug,  String categoryName,  String colorHex,  int favoriteCount)  $default,) {final _that = this;
switch (_that) {
case _TopCategory():
return $default(_that.categoryId,_that.categorySlug,_that.categoryName,_that.colorHex,_that.favoriteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String categoryId,  String categorySlug,  String categoryName,  String colorHex,  int favoriteCount)?  $default,) {final _that = this;
switch (_that) {
case _TopCategory() when $default != null:
return $default(_that.categoryId,_that.categorySlug,_that.categoryName,_that.colorHex,_that.favoriteCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopCategory implements TopCategory {
  const _TopCategory({required this.categoryId, required this.categorySlug, required this.categoryName, required this.colorHex, required this.favoriteCount});
  factory _TopCategory.fromJson(Map<String, dynamic> json) => _$TopCategoryFromJson(json);

@override final  String categoryId;
@override final  String categorySlug;
@override final  String categoryName;
@override final  String colorHex;
@override final  int favoriteCount;

/// Create a copy of TopCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopCategoryCopyWith<_TopCategory> get copyWith => __$TopCategoryCopyWithImpl<_TopCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categorySlug,categoryName,colorHex,favoriteCount);

@override
String toString() {
  return 'TopCategory(categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, colorHex: $colorHex, favoriteCount: $favoriteCount)';
}


}

/// @nodoc
abstract mixin class _$TopCategoryCopyWith<$Res> implements $TopCategoryCopyWith<$Res> {
  factory _$TopCategoryCopyWith(_TopCategory value, $Res Function(_TopCategory) _then) = __$TopCategoryCopyWithImpl;
@override @useResult
$Res call({
 String categoryId, String categorySlug, String categoryName, String colorHex, int favoriteCount
});




}
/// @nodoc
class __$TopCategoryCopyWithImpl<$Res>
    implements _$TopCategoryCopyWith<$Res> {
  __$TopCategoryCopyWithImpl(this._self, this._then);

  final _TopCategory _self;
  final $Res Function(_TopCategory) _then;

/// Create a copy of TopCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? colorHex = null,Object? favoriteCount = null,}) {
  return _then(_TopCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DauPoint {

 String get day;// ISO date, e.g. "2026-06-08"
 int get count;
/// Create a copy of DauPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DauPointCopyWith<DauPoint> get copyWith => _$DauPointCopyWithImpl<DauPoint>(this as DauPoint, _$identity);

  /// Serializes this DauPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DauPoint&&(identical(other.day, day) || other.day == day)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,count);

@override
String toString() {
  return 'DauPoint(day: $day, count: $count)';
}


}

/// @nodoc
abstract mixin class $DauPointCopyWith<$Res>  {
  factory $DauPointCopyWith(DauPoint value, $Res Function(DauPoint) _then) = _$DauPointCopyWithImpl;
@useResult
$Res call({
 String day, int count
});




}
/// @nodoc
class _$DauPointCopyWithImpl<$Res>
    implements $DauPointCopyWith<$Res> {
  _$DauPointCopyWithImpl(this._self, this._then);

  final DauPoint _self;
  final $Res Function(DauPoint) _then;

/// Create a copy of DauPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? count = null,}) {
  return _then(_self.copyWith(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DauPoint].
extension DauPointPatterns on DauPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DauPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DauPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DauPoint value)  $default,){
final _that = this;
switch (_that) {
case _DauPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DauPoint value)?  $default,){
final _that = this;
switch (_that) {
case _DauPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String day,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DauPoint() when $default != null:
return $default(_that.day,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String day,  int count)  $default,) {final _that = this;
switch (_that) {
case _DauPoint():
return $default(_that.day,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String day,  int count)?  $default,) {final _that = this;
switch (_that) {
case _DauPoint() when $default != null:
return $default(_that.day,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DauPoint implements DauPoint {
  const _DauPoint({required this.day, required this.count});
  factory _DauPoint.fromJson(Map<String, dynamic> json) => _$DauPointFromJson(json);

@override final  String day;
// ISO date, e.g. "2026-06-08"
@override final  int count;

/// Create a copy of DauPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DauPointCopyWith<_DauPoint> get copyWith => __$DauPointCopyWithImpl<_DauPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DauPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DauPoint&&(identical(other.day, day) || other.day == day)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,day,count);

@override
String toString() {
  return 'DauPoint(day: $day, count: $count)';
}


}

/// @nodoc
abstract mixin class _$DauPointCopyWith<$Res> implements $DauPointCopyWith<$Res> {
  factory _$DauPointCopyWith(_DauPoint value, $Res Function(_DauPoint) _then) = __$DauPointCopyWithImpl;
@override @useResult
$Res call({
 String day, int count
});




}
/// @nodoc
class __$DauPointCopyWithImpl<$Res>
    implements _$DauPointCopyWith<$Res> {
  __$DauPointCopyWithImpl(this._self, this._then);

  final _DauPoint _self;
  final $Res Function(_DauPoint) _then;

/// Create a copy of DauPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? count = null,}) {
  return _then(_DauPoint(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ActiveUsers {

 int get windowDays; int get dau; int get wau; int get mau; List<DauPoint> get series;
/// Create a copy of ActiveUsers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveUsersCopyWith<ActiveUsers> get copyWith => _$ActiveUsersCopyWithImpl<ActiveUsers>(this as ActiveUsers, _$identity);

  /// Serializes this ActiveUsers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveUsers&&(identical(other.windowDays, windowDays) || other.windowDays == windowDays)&&(identical(other.dau, dau) || other.dau == dau)&&(identical(other.wau, wau) || other.wau == wau)&&(identical(other.mau, mau) || other.mau == mau)&&const DeepCollectionEquality().equals(other.series, series));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,windowDays,dau,wau,mau,const DeepCollectionEquality().hash(series));

@override
String toString() {
  return 'ActiveUsers(windowDays: $windowDays, dau: $dau, wau: $wau, mau: $mau, series: $series)';
}


}

/// @nodoc
abstract mixin class $ActiveUsersCopyWith<$Res>  {
  factory $ActiveUsersCopyWith(ActiveUsers value, $Res Function(ActiveUsers) _then) = _$ActiveUsersCopyWithImpl;
@useResult
$Res call({
 int windowDays, int dau, int wau, int mau, List<DauPoint> series
});




}
/// @nodoc
class _$ActiveUsersCopyWithImpl<$Res>
    implements $ActiveUsersCopyWith<$Res> {
  _$ActiveUsersCopyWithImpl(this._self, this._then);

  final ActiveUsers _self;
  final $Res Function(ActiveUsers) _then;

/// Create a copy of ActiveUsers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? windowDays = null,Object? dau = null,Object? wau = null,Object? mau = null,Object? series = null,}) {
  return _then(_self.copyWith(
windowDays: null == windowDays ? _self.windowDays : windowDays // ignore: cast_nullable_to_non_nullable
as int,dau: null == dau ? _self.dau : dau // ignore: cast_nullable_to_non_nullable
as int,wau: null == wau ? _self.wau : wau // ignore: cast_nullable_to_non_nullable
as int,mau: null == mau ? _self.mau : mau // ignore: cast_nullable_to_non_nullable
as int,series: null == series ? _self.series : series // ignore: cast_nullable_to_non_nullable
as List<DauPoint>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveUsers].
extension ActiveUsersPatterns on ActiveUsers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveUsers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveUsers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveUsers value)  $default,){
final _that = this;
switch (_that) {
case _ActiveUsers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveUsers value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveUsers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int windowDays,  int dau,  int wau,  int mau,  List<DauPoint> series)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveUsers() when $default != null:
return $default(_that.windowDays,_that.dau,_that.wau,_that.mau,_that.series);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int windowDays,  int dau,  int wau,  int mau,  List<DauPoint> series)  $default,) {final _that = this;
switch (_that) {
case _ActiveUsers():
return $default(_that.windowDays,_that.dau,_that.wau,_that.mau,_that.series);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int windowDays,  int dau,  int wau,  int mau,  List<DauPoint> series)?  $default,) {final _that = this;
switch (_that) {
case _ActiveUsers() when $default != null:
return $default(_that.windowDays,_that.dau,_that.wau,_that.mau,_that.series);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveUsers implements ActiveUsers {
  const _ActiveUsers({required this.windowDays, required this.dau, required this.wau, required this.mau, required final  List<DauPoint> series}): _series = series;
  factory _ActiveUsers.fromJson(Map<String, dynamic> json) => _$ActiveUsersFromJson(json);

@override final  int windowDays;
@override final  int dau;
@override final  int wau;
@override final  int mau;
 final  List<DauPoint> _series;
@override List<DauPoint> get series {
  if (_series is EqualUnmodifiableListView) return _series;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_series);
}


/// Create a copy of ActiveUsers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveUsersCopyWith<_ActiveUsers> get copyWith => __$ActiveUsersCopyWithImpl<_ActiveUsers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveUsersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveUsers&&(identical(other.windowDays, windowDays) || other.windowDays == windowDays)&&(identical(other.dau, dau) || other.dau == dau)&&(identical(other.wau, wau) || other.wau == wau)&&(identical(other.mau, mau) || other.mau == mau)&&const DeepCollectionEquality().equals(other._series, _series));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,windowDays,dau,wau,mau,const DeepCollectionEquality().hash(_series));

@override
String toString() {
  return 'ActiveUsers(windowDays: $windowDays, dau: $dau, wau: $wau, mau: $mau, series: $series)';
}


}

/// @nodoc
abstract mixin class _$ActiveUsersCopyWith<$Res> implements $ActiveUsersCopyWith<$Res> {
  factory _$ActiveUsersCopyWith(_ActiveUsers value, $Res Function(_ActiveUsers) _then) = __$ActiveUsersCopyWithImpl;
@override @useResult
$Res call({
 int windowDays, int dau, int wau, int mau, List<DauPoint> series
});




}
/// @nodoc
class __$ActiveUsersCopyWithImpl<$Res>
    implements _$ActiveUsersCopyWith<$Res> {
  __$ActiveUsersCopyWithImpl(this._self, this._then);

  final _ActiveUsers _self;
  final $Res Function(_ActiveUsers) _then;

/// Create a copy of ActiveUsers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? windowDays = null,Object? dau = null,Object? wau = null,Object? mau = null,Object? series = null,}) {
  return _then(_ActiveUsers(
windowDays: null == windowDays ? _self.windowDays : windowDays // ignore: cast_nullable_to_non_nullable
as int,dau: null == dau ? _self.dau : dau // ignore: cast_nullable_to_non_nullable
as int,wau: null == wau ? _self.wau : wau // ignore: cast_nullable_to_non_nullable
as int,mau: null == mau ? _self.mau : mau // ignore: cast_nullable_to_non_nullable
as int,series: null == series ? _self._series : series // ignore: cast_nullable_to_non_nullable
as List<DauPoint>,
  ));
}


}

// dart format on
