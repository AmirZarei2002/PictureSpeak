import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart'; 
part 'user.g.dart'; 

enum UserRole {
  @JsonValue('USER')
  user,
  @JsonValue('ADMIN')
  admin,
}

@freezed
abstract class User with _$User {
  const User._();

  const factory User({
    required String id,
    String? email, 
    required bool isGuest,
    String? displayName,
    @Default(UserRole.user) UserRole role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  bool get isAdmin => role == UserRole.admin;
}
