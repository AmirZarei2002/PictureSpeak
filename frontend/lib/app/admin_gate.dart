import 'package:frontend/features/auth/data/user.dart';

String? requireAdmin(User? user) {
  if (user == null) return '/welcome';
  if (!user.isAdmin) return '/home';
  return null;
}
