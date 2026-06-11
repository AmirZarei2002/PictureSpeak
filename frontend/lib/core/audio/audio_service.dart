import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import 'package:frontend/core/api/api_client.dart';
import 'package:frontend/features/categories/data/learning_item.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  final FlutterTts _tts = FlutterTts();

  Future<void>? _ttsReady;

  Future<void> _ensureTtsReady() {
    return _ttsReady ??= () async {
      await _tts.awaitSpeakCompletion(true);
      await _tts.setLanguage('en-US');
      await _tts.setSpeechRate(0.45); 
      await _tts.setVolume(1.0);
      await _tts.setPitch(1.0);
    }();
  }

  Future<void> play(LearningItem item) async {
    await stop();
    final audioPath = item.audioPath;
    if (audioPath != null) {
      try {
        await _player.setUrl(mediaUrl(audioPath));
        await _player.play(); 
        return;
      } catch (e) {
        debugPrint('AudioService: recorded audio failed ($e) -> TTS fallback');
      }
    }
    await _ensureTtsReady();
    final result = await _tts.speak(item.name);
    debugPrint('AudioService: tts.speak("${item.name}") -> $result');
  }

  Future<void> stop() async {
    await _player.stop();
    await _tts.stop();
  }

  Future<void> dispose() async {
    await _player.dispose();
    await _tts.stop();
  }
}

final audioServiceProvider = Provider<AudioService>((ref) {
  final service = AudioService();
  ref.onDispose(service.dispose);
  return service;
});

class AudioController extends Notifier<String?> {
  int _token = 0;

  @override
  String? build() => null;

  Future<void> play(LearningItem item) async {
    final service = ref.read(audioServiceProvider);
    final myToken = ++_token;
    state = item.id; 
    try {
      await service.play(item);
    } catch (e, st) {
      debugPrint('AudioController: play failed: $e\n$st');
    } finally {
      if (_token == myToken) state = null; 
    }
  }
}

final audioControllerProvider = NotifierProvider<AudioController, String?>(
  AudioController.new,
);
