import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/admin/data/admin_repository.dart';
import 'package:frontend/features/admin/data/analytics.dart';

final analyticsOverviewProvider =
    FutureProvider.autoDispose<AnalyticsOverview>((ref) {
  return ref.watch(adminRepositoryProvider).getOverview();
});

final analyticsTopItemsProvider =
    FutureProvider.autoDispose<List<TopItem>>((ref) {
  return ref.watch(adminRepositoryProvider).getTopItems(limit: 10);
});

final analyticsActiveUsersProvider =
    FutureProvider.autoDispose<ActiveUsers>((ref) {
  return ref.watch(adminRepositoryProvider).getActiveUsers(days: 30);
});
