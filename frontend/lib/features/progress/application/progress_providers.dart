import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/features/progress/data/progress_repository.dart';
import 'package:frontend/features/progress/data/progress_summary.dart';

final progressSummaryProvider = FutureProvider<ProgressSummary>((ref) {
  return ref.watch(progressRepositoryProvider).getSummary();
});

class _Counts {
  int views = 0;
  int listens = 0;
}

class ProgressRecorder extends Notifier<int> {
  final Map<String, _Counts> _buffer = {};
  Timer? _timer;
  AppLifecycleListener? _lifecycle;

  @override
  int build() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) => flush());
    _lifecycle = AppLifecycleListener(onPause: flush);
    ref.onDispose(() {
      _timer?.cancel();
      _lifecycle?.dispose();
      flush();
    });
    return 0; 
  }

  void recordView(String itemId) {
    (_buffer[itemId] ??= _Counts()).views++;
    state = state + 1;
  }

  void recordListen(String itemId) {
    (_buffer[itemId] ??= _Counts()).listens++;
    state = state + 1;
  }

  Future<void> flush() async {
    if (_buffer.isEmpty) return;
    final events = _buffer.entries
        .map(
          (e) => {
            'itemId': e.key,
            'views': e.value.views,
            'listens': e.value.listens,
          },
        )
        .toList();
    _buffer.clear();
    state = 0;
    try {
      await ref.read(progressRepositoryProvider).postEvents(events);
      ref.invalidate(progressSummaryProvider); 
    } catch (_) {
    }
  }
}

final progressRecorderProvider = NotifierProvider<ProgressRecorder, int>(
  ProgressRecorder.new,
);
