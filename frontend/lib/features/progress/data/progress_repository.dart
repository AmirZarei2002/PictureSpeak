import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/progress/data/progress_summary.dart';

class ProgressRepository {
  ProgressRepository(this._dio);

  final Dio _dio;

  Future<void> postEvents(List<Map<String, dynamic>> events) =>
      _dio.post('/progress/events', data: events);

  Future<ProgressSummary> getSummary() async {
    final response = await _dio.get('/progress/summary');
    return ProgressSummary.fromJson(response.data as Map<String, dynamic>);
  }
}

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return ProgressRepository(ref.watch(dioProvider));
});
