import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  final stt.SpeechToText _speech = stt.SpeechToText();

  bool _isListening = false;
  String _lastWords = '';

  bool get isListening => _isListening;
  String get lastWords => _lastWords;

  /// Initialize speech recognition
  Future<bool> initialize() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );
    return available;
  }

  /// Start listening to the user's voice
  Future<void> startListening(Function(String) onResultCallback) async {
    _isListening = true;
    await _speech.listen(
      onResult: (result) {
        _lastWords = result.recognizedWords;
        if (result.finalResult) {
          onResultCallback(_lastWords);
        }
      },
      listenMode: stt.ListenMode.confirmation,
    );
  }

  /// Stop listening
  Future<void> stopListening() async {
    _isListening = false;
    await _speech.stop();
  }

  /// Cancel listening
  Future<void> cancelListening() async {
    _isListening = false;
    await _speech.cancel();
  }
}
