// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedList<T> {

 List<T> get data; PaginationMeta get meta;
/// Create a copy of PaginatedList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedListCopyWith<T, PaginatedList<T>> get copyWith => _$PaginatedListCopyWithImpl<T, PaginatedList<T>>(this as PaginatedList<T>, _$identity);

  /// Serializes this PaginatedList to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedList<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'PaginatedList<$T>(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $PaginatedListCopyWith<T,$Res>  {
  factory $PaginatedListCopyWith(PaginatedList<T> value, $Res Function(PaginatedList<T>) _then) = _$PaginatedListCopyWithImpl;
@useResult
$Res call({
 List<T> data, PaginationMeta meta
});


$PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$PaginatedListCopyWithImpl<T,$Res>
    implements $PaginatedListCopyWith<T, $Res> {
  _$PaginatedListCopyWithImpl(this._self, this._then);

  final PaginatedList<T> _self;
  final $Res Function(PaginatedList<T>) _then;

/// Create a copy of PaginatedList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}
/// Create a copy of PaginatedList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaginatedList].
extension PaginatedListPatterns<T> on PaginatedList<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedList<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedList<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedList<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  PaginationMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedList() when $default != null:
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  PaginationMeta meta)  $default,) {final _that = this;
switch (_that) {
case _PaginatedList():
return $default(_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  PaginationMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedList() when $default != null:
return $default(_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginatedList<T> implements PaginatedList<T> {
  const _PaginatedList({required final  List<T> data, required this.meta}): _data = data;
  factory _PaginatedList.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedListFromJson(json,fromJsonT);

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta meta;

/// Create a copy of PaginatedList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedListCopyWith<T, _PaginatedList<T>> get copyWith => __$PaginatedListCopyWithImpl<T, _PaginatedList<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginatedListToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedList<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'PaginatedList<$T>(data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$PaginatedListCopyWith<T,$Res> implements $PaginatedListCopyWith<T, $Res> {
  factory _$PaginatedListCopyWith(_PaginatedList<T> value, $Res Function(_PaginatedList<T>) _then) = __$PaginatedListCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, PaginationMeta meta
});


@override $PaginationMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$PaginatedListCopyWithImpl<T,$Res>
    implements _$PaginatedListCopyWith<T, $Res> {
  __$PaginatedListCopyWithImpl(this._self, this._then);

  final _PaginatedList<T> _self;
  final $Res Function(_PaginatedList<T>) _then;

/// Create a copy of PaginatedList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? meta = null,}) {
  return _then(_PaginatedList<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}

/// Create a copy of PaginatedList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get meta {
  
  return $PaginationMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$PaginationMeta {

 int get total; int get page; int get size; int get lastPage; int? get prevPage; int? get nextPage;
/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<PaginationMeta> get copyWith => _$PaginationMetaCopyWithImpl<PaginationMeta>(this as PaginationMeta, _$identity);

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationMeta&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,size,lastPage,prevPage,nextPage);

@override
String toString() {
  return 'PaginationMeta(total: $total, page: $page, size: $size, lastPage: $lastPage, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class $PaginationMetaCopyWith<$Res>  {
  factory $PaginationMetaCopyWith(PaginationMeta value, $Res Function(PaginationMeta) _then) = _$PaginationMetaCopyWithImpl;
@useResult
$Res call({
 int total, int page, int size, int lastPage, int? prevPage, int? nextPage
});




}
/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._self, this._then);

  final PaginationMeta _self;
  final $Res Function(PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? size = null,Object? lastPage = null,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as int?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationMeta].
extension PaginationMetaPatterns on PaginationMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationMeta value)  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationMeta value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int size,  int lastPage,  int? prevPage,  int? nextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.total,_that.page,_that.size,_that.lastPage,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int size,  int lastPage,  int? prevPage,  int? nextPage)  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta():
return $default(_that.total,_that.page,_that.size,_that.lastPage,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int size,  int lastPage,  int? prevPage,  int? nextPage)?  $default,) {final _that = this;
switch (_that) {
case _PaginationMeta() when $default != null:
return $default(_that.total,_that.page,_that.size,_that.lastPage,_that.prevPage,_that.nextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationMeta implements PaginationMeta {
  const _PaginationMeta({required this.total, required this.page, required this.size, required this.lastPage, this.prevPage, this.nextPage});
  factory _PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);

@override final  int total;
@override final  int page;
@override final  int size;
@override final  int lastPage;
@override final  int? prevPage;
@override final  int? nextPage;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationMetaCopyWith<_PaginationMeta> get copyWith => __$PaginationMetaCopyWithImpl<_PaginationMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationMeta&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,size,lastPage,prevPage,nextPage);

@override
String toString() {
  return 'PaginationMeta(total: $total, page: $page, size: $size, lastPage: $lastPage, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class _$PaginationMetaCopyWith<$Res> implements $PaginationMetaCopyWith<$Res> {
  factory _$PaginationMetaCopyWith(_PaginationMeta value, $Res Function(_PaginationMeta) _then) = __$PaginationMetaCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int size, int lastPage, int? prevPage, int? nextPage
});




}
/// @nodoc
class __$PaginationMetaCopyWithImpl<$Res>
    implements _$PaginationMetaCopyWith<$Res> {
  __$PaginationMetaCopyWithImpl(this._self, this._then);

  final _PaginationMeta _self;
  final $Res Function(_PaginationMeta) _then;

/// Create a copy of PaginationMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? size = null,Object? lastPage = null,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_PaginationMeta(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as int?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AdminUserListItem {

 String get id; String? get email; String? get displayName; UserRole get role; bool get isGuest; DateTime get createdAt; int get progressCount; DateTime? get lastSeenAt;
/// Create a copy of AdminUserListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserListItemCopyWith<AdminUserListItem> get copyWith => _$AdminUserListItemCopyWithImpl<AdminUserListItem>(this as AdminUserListItem, _$identity);

  /// Serializes this AdminUserListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isGuest, isGuest) || other.isGuest == isGuest)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.progressCount, progressCount) || other.progressCount == progressCount)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,isGuest,createdAt,progressCount,lastSeenAt);

@override
String toString() {
  return 'AdminUserListItem(id: $id, email: $email, displayName: $displayName, role: $role, isGuest: $isGuest, createdAt: $createdAt, progressCount: $progressCount, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $AdminUserListItemCopyWith<$Res>  {
  factory $AdminUserListItemCopyWith(AdminUserListItem value, $Res Function(AdminUserListItem) _then) = _$AdminUserListItemCopyWithImpl;
@useResult
$Res call({
 String id, String? email, String? displayName, UserRole role, bool isGuest, DateTime createdAt, int progressCount, DateTime? lastSeenAt
});




}
/// @nodoc
class _$AdminUserListItemCopyWithImpl<$Res>
    implements $AdminUserListItemCopyWith<$Res> {
  _$AdminUserListItemCopyWithImpl(this._self, this._then);

  final AdminUserListItem _self;
  final $Res Function(AdminUserListItem) _then;

/// Create a copy of AdminUserListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = freezed,Object? displayName = freezed,Object? role = null,Object? isGuest = null,Object? createdAt = null,Object? progressCount = null,Object? lastSeenAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isGuest: null == isGuest ? _self.isGuest : isGuest // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,progressCount: null == progressCount ? _self.progressCount : progressCount // ignore: cast_nullable_to_non_nullable
as int,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserListItem].
extension AdminUserListItemPatterns on AdminUserListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserListItem value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserListItem value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? email,  String? displayName,  UserRole role,  bool isGuest,  DateTime createdAt,  int progressCount,  DateTime? lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserListItem() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.isGuest,_that.createdAt,_that.progressCount,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? email,  String? displayName,  UserRole role,  bool isGuest,  DateTime createdAt,  int progressCount,  DateTime? lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _AdminUserListItem():
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.isGuest,_that.createdAt,_that.progressCount,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? email,  String? displayName,  UserRole role,  bool isGuest,  DateTime createdAt,  int progressCount,  DateTime? lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserListItem() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.isGuest,_that.createdAt,_that.progressCount,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserListItem implements AdminUserListItem {
  const _AdminUserListItem({required this.id, this.email, this.displayName, this.role = UserRole.user, required this.isGuest, required this.createdAt, required this.progressCount, this.lastSeenAt});
  factory _AdminUserListItem.fromJson(Map<String, dynamic> json) => _$AdminUserListItemFromJson(json);

@override final  String id;
@override final  String? email;
@override final  String? displayName;
@override@JsonKey() final  UserRole role;
@override final  bool isGuest;
@override final  DateTime createdAt;
@override final  int progressCount;
@override final  DateTime? lastSeenAt;

/// Create a copy of AdminUserListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserListItemCopyWith<_AdminUserListItem> get copyWith => __$AdminUserListItemCopyWithImpl<_AdminUserListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isGuest, isGuest) || other.isGuest == isGuest)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.progressCount, progressCount) || other.progressCount == progressCount)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,isGuest,createdAt,progressCount,lastSeenAt);

@override
String toString() {
  return 'AdminUserListItem(id: $id, email: $email, displayName: $displayName, role: $role, isGuest: $isGuest, createdAt: $createdAt, progressCount: $progressCount, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$AdminUserListItemCopyWith<$Res> implements $AdminUserListItemCopyWith<$Res> {
  factory _$AdminUserListItemCopyWith(_AdminUserListItem value, $Res Function(_AdminUserListItem) _then) = __$AdminUserListItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String? email, String? displayName, UserRole role, bool isGuest, DateTime createdAt, int progressCount, DateTime? lastSeenAt
});




}
/// @nodoc
class __$AdminUserListItemCopyWithImpl<$Res>
    implements _$AdminUserListItemCopyWith<$Res> {
  __$AdminUserListItemCopyWithImpl(this._self, this._then);

  final _AdminUserListItem _self;
  final $Res Function(_AdminUserListItem) _then;

/// Create a copy of AdminUserListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = freezed,Object? displayName = freezed,Object? role = null,Object? isGuest = null,Object? createdAt = null,Object? progressCount = null,Object? lastSeenAt = freezed,}) {
  return _then(_AdminUserListItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isGuest: null == isGuest ? _self.isGuest : isGuest // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,progressCount: null == progressCount ? _self.progressCount : progressCount // ignore: cast_nullable_to_non_nullable
as int,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$AdminUserDetail {

 String get id; String? get email; String? get displayName; UserRole get role; bool get isGuest; String get textScale; String get themeMode; double get speechRate; bool get soundEffectsOn; DateTime get createdAt; DateTime get updatedAt; int get progressCount; DateTime? get lastSeenAt;
/// Create a copy of AdminUserDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserDetailCopyWith<AdminUserDetail> get copyWith => _$AdminUserDetailCopyWithImpl<AdminUserDetail>(this as AdminUserDetail, _$identity);

  /// Serializes this AdminUserDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isGuest, isGuest) || other.isGuest == isGuest)&&(identical(other.textScale, textScale) || other.textScale == textScale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.speechRate, speechRate) || other.speechRate == speechRate)&&(identical(other.soundEffectsOn, soundEffectsOn) || other.soundEffectsOn == soundEffectsOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.progressCount, progressCount) || other.progressCount == progressCount)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,isGuest,textScale,themeMode,speechRate,soundEffectsOn,createdAt,updatedAt,progressCount,lastSeenAt);

@override
String toString() {
  return 'AdminUserDetail(id: $id, email: $email, displayName: $displayName, role: $role, isGuest: $isGuest, textScale: $textScale, themeMode: $themeMode, speechRate: $speechRate, soundEffectsOn: $soundEffectsOn, createdAt: $createdAt, updatedAt: $updatedAt, progressCount: $progressCount, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $AdminUserDetailCopyWith<$Res>  {
  factory $AdminUserDetailCopyWith(AdminUserDetail value, $Res Function(AdminUserDetail) _then) = _$AdminUserDetailCopyWithImpl;
@useResult
$Res call({
 String id, String? email, String? displayName, UserRole role, bool isGuest, String textScale, String themeMode, double speechRate, bool soundEffectsOn, DateTime createdAt, DateTime updatedAt, int progressCount, DateTime? lastSeenAt
});




}
/// @nodoc
class _$AdminUserDetailCopyWithImpl<$Res>
    implements $AdminUserDetailCopyWith<$Res> {
  _$AdminUserDetailCopyWithImpl(this._self, this._then);

  final AdminUserDetail _self;
  final $Res Function(AdminUserDetail) _then;

/// Create a copy of AdminUserDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = freezed,Object? displayName = freezed,Object? role = null,Object? isGuest = null,Object? textScale = null,Object? themeMode = null,Object? speechRate = null,Object? soundEffectsOn = null,Object? createdAt = null,Object? updatedAt = null,Object? progressCount = null,Object? lastSeenAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isGuest: null == isGuest ? _self.isGuest : isGuest // ignore: cast_nullable_to_non_nullable
as bool,textScale: null == textScale ? _self.textScale : textScale // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,speechRate: null == speechRate ? _self.speechRate : speechRate // ignore: cast_nullable_to_non_nullable
as double,soundEffectsOn: null == soundEffectsOn ? _self.soundEffectsOn : soundEffectsOn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,progressCount: null == progressCount ? _self.progressCount : progressCount // ignore: cast_nullable_to_non_nullable
as int,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserDetail].
extension AdminUserDetailPatterns on AdminUserDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserDetail value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserDetail value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? email,  String? displayName,  UserRole role,  bool isGuest,  String textScale,  String themeMode,  double speechRate,  bool soundEffectsOn,  DateTime createdAt,  DateTime updatedAt,  int progressCount,  DateTime? lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserDetail() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.isGuest,_that.textScale,_that.themeMode,_that.speechRate,_that.soundEffectsOn,_that.createdAt,_that.updatedAt,_that.progressCount,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? email,  String? displayName,  UserRole role,  bool isGuest,  String textScale,  String themeMode,  double speechRate,  bool soundEffectsOn,  DateTime createdAt,  DateTime updatedAt,  int progressCount,  DateTime? lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _AdminUserDetail():
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.isGuest,_that.textScale,_that.themeMode,_that.speechRate,_that.soundEffectsOn,_that.createdAt,_that.updatedAt,_that.progressCount,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? email,  String? displayName,  UserRole role,  bool isGuest,  String textScale,  String themeMode,  double speechRate,  bool soundEffectsOn,  DateTime createdAt,  DateTime updatedAt,  int progressCount,  DateTime? lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserDetail() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.isGuest,_that.textScale,_that.themeMode,_that.speechRate,_that.soundEffectsOn,_that.createdAt,_that.updatedAt,_that.progressCount,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserDetail implements AdminUserDetail {
  const _AdminUserDetail({required this.id, this.email, this.displayName, this.role = UserRole.user, required this.isGuest, required this.textScale, required this.themeMode, required this.speechRate, required this.soundEffectsOn, required this.createdAt, required this.updatedAt, required this.progressCount, this.lastSeenAt});
  factory _AdminUserDetail.fromJson(Map<String, dynamic> json) => _$AdminUserDetailFromJson(json);

@override final  String id;
@override final  String? email;
@override final  String? displayName;
@override@JsonKey() final  UserRole role;
@override final  bool isGuest;
@override final  String textScale;
@override final  String themeMode;
@override final  double speechRate;
@override final  bool soundEffectsOn;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int progressCount;
@override final  DateTime? lastSeenAt;

/// Create a copy of AdminUserDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserDetailCopyWith<_AdminUserDetail> get copyWith => __$AdminUserDetailCopyWithImpl<_AdminUserDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.isGuest, isGuest) || other.isGuest == isGuest)&&(identical(other.textScale, textScale) || other.textScale == textScale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.speechRate, speechRate) || other.speechRate == speechRate)&&(identical(other.soundEffectsOn, soundEffectsOn) || other.soundEffectsOn == soundEffectsOn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.progressCount, progressCount) || other.progressCount == progressCount)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,isGuest,textScale,themeMode,speechRate,soundEffectsOn,createdAt,updatedAt,progressCount,lastSeenAt);

@override
String toString() {
  return 'AdminUserDetail(id: $id, email: $email, displayName: $displayName, role: $role, isGuest: $isGuest, textScale: $textScale, themeMode: $themeMode, speechRate: $speechRate, soundEffectsOn: $soundEffectsOn, createdAt: $createdAt, updatedAt: $updatedAt, progressCount: $progressCount, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$AdminUserDetailCopyWith<$Res> implements $AdminUserDetailCopyWith<$Res> {
  factory _$AdminUserDetailCopyWith(_AdminUserDetail value, $Res Function(_AdminUserDetail) _then) = __$AdminUserDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String? email, String? displayName, UserRole role, bool isGuest, String textScale, String themeMode, double speechRate, bool soundEffectsOn, DateTime createdAt, DateTime updatedAt, int progressCount, DateTime? lastSeenAt
});




}
/// @nodoc
class __$AdminUserDetailCopyWithImpl<$Res>
    implements _$AdminUserDetailCopyWith<$Res> {
  __$AdminUserDetailCopyWithImpl(this._self, this._then);

  final _AdminUserDetail _self;
  final $Res Function(_AdminUserDetail) _then;

/// Create a copy of AdminUserDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = freezed,Object? displayName = freezed,Object? role = null,Object? isGuest = null,Object? textScale = null,Object? themeMode = null,Object? speechRate = null,Object? soundEffectsOn = null,Object? createdAt = null,Object? updatedAt = null,Object? progressCount = null,Object? lastSeenAt = freezed,}) {
  return _then(_AdminUserDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isGuest: null == isGuest ? _self.isGuest : isGuest // ignore: cast_nullable_to_non_nullable
as bool,textScale: null == textScale ? _self.textScale : textScale // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,speechRate: null == speechRate ? _self.speechRate : speechRate // ignore: cast_nullable_to_non_nullable
as double,soundEffectsOn: null == soundEffectsOn ? _self.soundEffectsOn : soundEffectsOn // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,progressCount: null == progressCount ? _self.progressCount : progressCount // ignore: cast_nullable_to_non_nullable
as int,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$UserProgressRow {

 String get itemId; String get itemSlug; String get itemName; String get categoryId; String get categorySlug; String get categoryName; int get viewCount; int get listenCount; DateTime get firstSeenAt; DateTime get lastSeenAt;
/// Create a copy of UserProgressRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProgressRowCopyWith<UserProgressRow> get copyWith => _$UserProgressRowCopyWithImpl<UserProgressRow>(this as UserProgressRow, _$identity);

  /// Serializes this UserProgressRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProgressRow&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemSlug, itemSlug) || other.itemSlug == itemSlug)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.listenCount, listenCount) || other.listenCount == listenCount)&&(identical(other.firstSeenAt, firstSeenAt) || other.firstSeenAt == firstSeenAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemSlug,itemName,categoryId,categorySlug,categoryName,viewCount,listenCount,firstSeenAt,lastSeenAt);

@override
String toString() {
  return 'UserProgressRow(itemId: $itemId, itemSlug: $itemSlug, itemName: $itemName, categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, viewCount: $viewCount, listenCount: $listenCount, firstSeenAt: $firstSeenAt, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $UserProgressRowCopyWith<$Res>  {
  factory $UserProgressRowCopyWith(UserProgressRow value, $Res Function(UserProgressRow) _then) = _$UserProgressRowCopyWithImpl;
@useResult
$Res call({
 String itemId, String itemSlug, String itemName, String categoryId, String categorySlug, String categoryName, int viewCount, int listenCount, DateTime firstSeenAt, DateTime lastSeenAt
});




}
/// @nodoc
class _$UserProgressRowCopyWithImpl<$Res>
    implements $UserProgressRowCopyWith<$Res> {
  _$UserProgressRowCopyWithImpl(this._self, this._then);

  final UserProgressRow _self;
  final $Res Function(UserProgressRow) _then;

/// Create a copy of UserProgressRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? itemSlug = null,Object? itemName = null,Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? viewCount = null,Object? listenCount = null,Object? firstSeenAt = null,Object? lastSeenAt = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemSlug: null == itemSlug ? _self.itemSlug : itemSlug // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,listenCount: null == listenCount ? _self.listenCount : listenCount // ignore: cast_nullable_to_non_nullable
as int,firstSeenAt: null == firstSeenAt ? _self.firstSeenAt : firstSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProgressRow].
extension UserProgressRowPatterns on UserProgressRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProgressRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProgressRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProgressRow value)  $default,){
final _that = this;
switch (_that) {
case _UserProgressRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProgressRow value)?  $default,){
final _that = this;
switch (_that) {
case _UserProgressRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String itemSlug,  String itemName,  String categoryId,  String categorySlug,  String categoryName,  int viewCount,  int listenCount,  DateTime firstSeenAt,  DateTime lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProgressRow() when $default != null:
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.categoryId,_that.categorySlug,_that.categoryName,_that.viewCount,_that.listenCount,_that.firstSeenAt,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String itemSlug,  String itemName,  String categoryId,  String categorySlug,  String categoryName,  int viewCount,  int listenCount,  DateTime firstSeenAt,  DateTime lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _UserProgressRow():
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.categoryId,_that.categorySlug,_that.categoryName,_that.viewCount,_that.listenCount,_that.firstSeenAt,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String itemSlug,  String itemName,  String categoryId,  String categorySlug,  String categoryName,  int viewCount,  int listenCount,  DateTime firstSeenAt,  DateTime lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProgressRow() when $default != null:
return $default(_that.itemId,_that.itemSlug,_that.itemName,_that.categoryId,_that.categorySlug,_that.categoryName,_that.viewCount,_that.listenCount,_that.firstSeenAt,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProgressRow implements UserProgressRow {
  const _UserProgressRow({required this.itemId, required this.itemSlug, required this.itemName, required this.categoryId, required this.categorySlug, required this.categoryName, required this.viewCount, required this.listenCount, required this.firstSeenAt, required this.lastSeenAt});
  factory _UserProgressRow.fromJson(Map<String, dynamic> json) => _$UserProgressRowFromJson(json);

@override final  String itemId;
@override final  String itemSlug;
@override final  String itemName;
@override final  String categoryId;
@override final  String categorySlug;
@override final  String categoryName;
@override final  int viewCount;
@override final  int listenCount;
@override final  DateTime firstSeenAt;
@override final  DateTime lastSeenAt;

/// Create a copy of UserProgressRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProgressRowCopyWith<_UserProgressRow> get copyWith => __$UserProgressRowCopyWithImpl<_UserProgressRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProgressRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProgressRow&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemSlug, itemSlug) || other.itemSlug == itemSlug)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categorySlug, categorySlug) || other.categorySlug == categorySlug)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.listenCount, listenCount) || other.listenCount == listenCount)&&(identical(other.firstSeenAt, firstSeenAt) || other.firstSeenAt == firstSeenAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemSlug,itemName,categoryId,categorySlug,categoryName,viewCount,listenCount,firstSeenAt,lastSeenAt);

@override
String toString() {
  return 'UserProgressRow(itemId: $itemId, itemSlug: $itemSlug, itemName: $itemName, categoryId: $categoryId, categorySlug: $categorySlug, categoryName: $categoryName, viewCount: $viewCount, listenCount: $listenCount, firstSeenAt: $firstSeenAt, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$UserProgressRowCopyWith<$Res> implements $UserProgressRowCopyWith<$Res> {
  factory _$UserProgressRowCopyWith(_UserProgressRow value, $Res Function(_UserProgressRow) _then) = __$UserProgressRowCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String itemSlug, String itemName, String categoryId, String categorySlug, String categoryName, int viewCount, int listenCount, DateTime firstSeenAt, DateTime lastSeenAt
});




}
/// @nodoc
class __$UserProgressRowCopyWithImpl<$Res>
    implements _$UserProgressRowCopyWith<$Res> {
  __$UserProgressRowCopyWithImpl(this._self, this._then);

  final _UserProgressRow _self;
  final $Res Function(_UserProgressRow) _then;

/// Create a copy of UserProgressRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? itemSlug = null,Object? itemName = null,Object? categoryId = null,Object? categorySlug = null,Object? categoryName = null,Object? viewCount = null,Object? listenCount = null,Object? firstSeenAt = null,Object? lastSeenAt = null,}) {
  return _then(_UserProgressRow(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemSlug: null == itemSlug ? _self.itemSlug : itemSlug // ignore: cast_nullable_to_non_nullable
as String,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categorySlug: null == categorySlug ? _self.categorySlug : categorySlug // ignore: cast_nullable_to_non_nullable
as String,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,listenCount: null == listenCount ? _self.listenCount : listenCount // ignore: cast_nullable_to_non_nullable
as int,firstSeenAt: null == firstSeenAt ? _self.firstSeenAt : firstSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
