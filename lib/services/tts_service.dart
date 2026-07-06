import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _tts = FlutterTts();

  TTSService() {
    _initTTS();
  }

  Future<void> _initTTS() async {
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.1); // Slightly emotional tone
    await _tts.setSpeechRate(0.9); // Calm and smooth speech
  }

  /// Speak the given text aloud
  Future<void> speak(String text) async {
    await _tts.stop(); // Stop previous speech
    await _tts.speak(text);
  }

  /// Stop speaking
  Future<void> stop() async {
    await _tts.stop();
  }
}
