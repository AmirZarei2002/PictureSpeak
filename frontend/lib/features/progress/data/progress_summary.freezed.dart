// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryProgress {

 String get categoryId; String get categorySlug; String get categoryName; int get explored; int get total;
/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProgressCopyWith<CategoryProgress> get copyWith => _$CategoryProgressCopyWithImpl<CategoryProgress>(this as CategoryProgress, _$identity);

  /// Serializes this CategoryProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProgress&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.explored, explored) || other.explored == explored)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categorySlug,categoryName,explored,total);

@override
String toString() {
  return 'CategoryProgress(categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, explored: $explored, total: $total)';
}


}

/// @nodoc
abstract mixin class $CategoryProgressCopyWith<$Res>  {
  factory $CategoryProgressCopyWith(CategoryProgress value, $Res Function(CategoryProgress) _then) = _$CategoryProgressCopyWithImpl;
@useResult
$Res call({
 String categoryId, String categorySlug, String categoryName, int explored, int total
});




}
/// @nodoc
class _$CategoryProgressCopyWithImpl<$Res>
    implements $CategoryProgressCopyWith<$Res> {
  _$CategoryProgressCopyWithImpl(this._self, this._then);

  final CategoryProgress _self;
  final $Res Function(CategoryProgress) _then;

/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? explored = null,Object? total = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,explored: null == explored ? _self.explored : explored // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryProgress].
extension CategoryProgressPatterns on CategoryProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryProgress value)  $default,){
final _that = this;
switch (_that) {
case _CategoryProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryProgress value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String categoryId,  String categorySlug,  String categoryName,  int explored,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
return $default(_that.categoryId,_that.categorySlug,_that.categoryName,_that.explored,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String categoryId,  String categorySlug,  String categoryName,  int explored,  int total)  $default,) {final _that = this;
switch (_that) {
case _CategoryProgress():
return $default(_that.categoryId,_that.categorySlug,_that.categoryName,_that.explored,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String categoryId,  String categorySlug,  String categoryName,  int explored,  int total)?  $default,) {final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
return $default(_that.categoryId,_that.categorySlug,_that.categoryName,_that.explored,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryProgress implements CategoryProgress {
  const _CategoryProgress({required this.categoryId, required this.categorySlug, required this.categoryName, required this.explored, required this.total});
  factory _CategoryProgress.fromJson(Map<String, dynamic> json) => _$CategoryProgressFromJson(json);

@override final  String categoryId;
@override final  String categorySlug;
@override final  String categoryName;
@override final  int explored;
@override final  int total;

/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryProgressCopyWith<_CategoryProgress> get copyWith => __$CategoryProgressCopyWithImpl<_CategoryProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryProgress&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.explored, explored) || other.explored == explored)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,categorySlug,categoryName,explored,total);

@override
String toString() {
  return 'CategoryProgress(categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, explored: $explored, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CategoryProgressCopyWith<$Res> implements $CategoryProgressCopyWith<$Res> {
  factory _$CategoryProgressCopyWith(_CategoryProgress value, $Res Function(_CategoryProgress) _then) = __$CategoryProgressCopyWithImpl;
@override @useResult
$Res call({
 String categoryId, String categorySlug, String categoryName, int explored, int total
});




}
/// @nodoc
class __$CategoryProgressCopyWithImpl<$Res>
    implements _$CategoryProgressCopyWith<$Res> {
  __$CategoryProgressCopyWithImpl(this._self, this._then);

  final _CategoryProgress _self;
  final $Res Function(_CategoryProgress) _then;

/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? explored = null,Object? total = null,}) {
  return _then(_CategoryProgress(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,explored: null == explored ? _self.explored : explored // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProgressSummary {

 int get totalViews; int get totalListens; int get itemsExplored; List<CategoryProgress> get byCategory;
/// Create a copy of ProgressSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressSummaryCopyWith<ProgressSummary> get copyWith => _$ProgressSummaryCopyWithImpl<ProgressSummary>(this as ProgressSummary, _$identity);

  /// Serializes this ProgressSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressSummary&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalListens, totalListens) || other.totalListens == totalListens)&&(identical(other.itemsExplored, itemsExplored) || other.itemsExplored == itemsExplored)&&const DeepCollectionEquality().equals(other.byCategory, byCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalViews,totalListens,itemsExplored,const DeepCollectionEquality().hash(byCategory));

@override
String toString() {
  return 'ProgressSummary(totalViews: $totalViews, totalListens: $totalListens, itemsExplored: $itemsExplored, byCategory: $byCategory)';
}


}

/// @nodoc
abstract mixin class $ProgressSummaryCopyWith<$Res>  {
  factory $ProgressSummaryCopyWith(ProgressSummary value, $Res Function(ProgressSummary) _then) = _$ProgressSummaryCopyWithImpl;
@useResult
$Res call({
 int totalViews, int totalListens, int itemsExplored, List<CategoryProgress> byCategory
});




}
/// @nodoc
class _$ProgressSummaryCopyWithImpl<$Res>
    implements $ProgressSummaryCopyWith<$Res> {
  _$ProgressSummaryCopyWithImpl(this._self, this._then);

  final ProgressSummary _self;
  final $Res Function(ProgressSummary) _then;

/// Create a copy of ProgressSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalViews = null,Object? totalListens = null,Object? itemsExplored = null,Object? byCategory = null,}) {
  return _then(_self.copyWith(
totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalListens: null == totalListens ? _self.totalListens : totalListens // ignore: cast_nullable_to_non_nullable
as int,itemsExplored: null == itemsExplored ? _self.itemsExplored : itemsExplored // ignore: cast_nullable_to_non_nullable
as int,byCategory: null == byCategory ? _self.byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as List<CategoryProgress>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressSummary].
extension ProgressSummaryPatterns on ProgressSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressSummary value)  $default,){
final _that = this;
switch (_that) {
case _ProgressSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalViews,  int totalListens,  int itemsExplored,  List<CategoryProgress> byCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressSummary() when $default != null:
return $default(_that.totalViews,_that.totalListens,_that.itemsExplored,_that.byCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalViews,  int totalListens,  int itemsExplored,  List<CategoryProgress> byCategory)  $default,) {final _that = this;
switch (_that) {
case _ProgressSummary():
return $default(_that.totalViews,_that.totalListens,_that.itemsExplored,_that.byCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalViews,  int totalListens,  int itemsExplored,  List<CategoryProgress> byCategory)?  $default,) {final _that = this;
switch (_that) {
case _ProgressSummary() when $default != null:
return $default(_that.totalViews,_that.totalListens,_that.itemsExplored,_that.byCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressSummary implements ProgressSummary {
  const _ProgressSummary({required this.totalViews, required this.totalListens, required this.itemsExplored, required final  List<CategoryProgress> byCategory}): _byCategory = byCategory;
  factory _ProgressSummary.fromJson(Map<String, dynamic> json) => _$ProgressSummaryFromJson(json);

@override final  int totalViews;
@override final  int totalListens;
@override final  int itemsExplored;
 final  List<CategoryProgress> _byCategory;
@override List<CategoryProgress> get byCategory {
  if (_byCategory is EqualUnmodifiableListView) return _byCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byCategory);
}


/// Create a copy of ProgressSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressSummaryCopyWith<_ProgressSummary> get copyWith => __$ProgressSummaryCopyWithImpl<_ProgressSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressSummary&&(identical(other.totalViews, totalViews) || other.totalViews == totalViews)&&(identical(other.totalListens, totalListens) || other.totalListens == totalListens)&&(identical(other.itemsExplored, itemsExplored) || other.itemsExplored == itemsExplored)&&const DeepCollectionEquality().equals(other._byCategory, _byCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalViews,totalListens,itemsExplored,const DeepCollectionEquality().hash(_byCategory));

@override
String toString() {
  return 'ProgressSummary(totalViews: $totalViews, totalListens: $totalListens, itemsExplored: $itemsExplored, byCategory: $byCategory)';
}


}

/// @nodoc
abstract mixin class _$ProgressSummaryCopyWith<$Res> implements $ProgressSummaryCopyWith<$Res> {
  factory _$ProgressSummaryCopyWith(_ProgressSummary value, $Res Function(_ProgressSummary) _then) = __$ProgressSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalViews, int totalListens, int itemsExplored, List<CategoryProgress> byCategory
});




}
/// @nodoc
class __$ProgressSummaryCopyWithImpl<$Res>
    implements _$ProgressSummaryCopyWith<$Res> {
  __$ProgressSummaryCopyWithImpl(this._self, this._then);

  final _ProgressSummary _self;
  final $Res Function(_ProgressSummary) _then;

/// Create a copy of ProgressSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalViews = null,Object? totalListens = null,Object? itemsExplored = null,Object? byCategory = null,}) {
  return _then(_ProgressSummary(
totalViews: null == totalViews ? _self.totalViews : totalViews // ignore: cast_nullable_to_non_nullable
as int,totalListens: null == totalListens ? _self.totalListens : totalListens // ignore: cast_nullable_to_non_nullable
as int,itemsExplored: null == itemsExplored ? _self.itemsExplored : itemsExplored // ignore: cast_nullable_to_non_nullable
as int,byCategory: null == byCategory ? _self._byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as List<CategoryProgress>,
  ));
}


}

// dart format on
