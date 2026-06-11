// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String?,
  isGuest: json['isGuest'] as bool,
  displayName: json['displayName'] as String?,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.user,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'isGuest': instance.isGuest,
  'displayName': instance.displayName,
  'role': _$UserRoleEnumMap[instance.role]!,
};

const _$UserRoleEnumMap = {UserRole.user: 'USER', UserRole.admin: 'ADMIN'};
