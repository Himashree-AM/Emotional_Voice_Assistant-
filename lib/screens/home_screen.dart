import 'package:flutter/material.dart';
import '../services/speech_service.dart';
import '../services/nlu_service.dart';
import '../services/tts_service.dart'; // ✅ New TTS service import

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechService _speech = SpeechService();
  final NLUService _nluService = NLUService();
  final TTSService _ttsService = TTSService(); // ✅ New TTS service instance

  bool _isListening = false;
  String _text = "Press the mic and start speaking...";
  String _response = "";

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    final ok = await _speech.initialize();
    if (!ok) {
      setState(() {
        _text = "Speech recognition not available";
      });
    }
  }

  void _startListening() async {
    setState(() => _isListening = true);
    await _speech.startListening((words) {
      setState(() {
        _text = words;
      });
      _generateResponse(words);
    });
  }

  void _stopListening() async {
    setState(() => _isListening = false);
    await _speech.stopListening();
  }

  void _cancelListening() async {
    await _speech.cancelListening();
    setState(() {
      _text = "Listening cancelled.";
    });
  }

  /// Generate emotional AI response + speak it aloud
  Future<void> _generateResponse(String userText) async {
    setState(() {
      _response = "Thinking... 🤔";
    });

    try {
      final reply = await _nluService.getResponse(userText);

      setState(() {
        _response = reply;
      });

      await _ttsService.speak(reply); // ✅ TTS service used
    } catch (e) {
      setState(() {
        _response =
            "I'm sorry, I had trouble understanding that. Please try again.";
      });
      await _ttsService.speak(_response); // ✅ TTS service used
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text("Emotional Voice Assistant"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You said:",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Assistant says:",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _response,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            Center(
              child: FloatingActionButton(
                onPressed: _isListening ? _stopListening : _startListening,
                backgroundColor: _isListening ? Colors.red : Colors.blueAccent,
                child: Icon(_isListening ? Icons.mic_off : Icons.mic, size: 30),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _cancelListening,
              child: const Text(
                "Cancel Listening",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
