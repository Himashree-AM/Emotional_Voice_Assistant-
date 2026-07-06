# Emotional Voice Assistant

A Flutter-based voice assistant application that transcribes voice input, infers emotional context, and responds with emotionally intelligent replies using text-to-speech.

## Features

- **Speech Recognition**: Converts spoken words to text using `speech_to_text` plugin
- **Natural Language Understanding**: Processes user input and generates responses via Google Gemini API
- **Text-to-Speech**: Responds with spoken audio using `flutter_tts` plugin
- **Emotional Intelligence**: AI-powered responses with empathy and positivity
- **Cross-Platform**: Runs on web (Chrome/Edge), Windows, Android, and iOS

## Project Structure

```
lib/
├── main.dart              # App entry point
├── screens/
│   └── home_screen.dart   # Main UI with microphone button
├── services/
│   ├── speech_service.dart    # Speech-to-text functionality
│   ├── nlu_service.dart       # NLU with Google Gemini API
│   └── tts_service.dart       # Text-to-speech functionality
└── models/
    └── analysis_result.dart   # Data models
```

## Getting Started

### Prerequisites

- Flutter 3.44.4 or higher
- Dart SDK 3.12.2 or higher
- Chrome or Edge browser (for web development)
- Google Gemini API key

### Installation

1. Clone the repository
2. Navigate to the project directory:
   ```bash
   cd emotional_voice_assistant
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

**Web (Chrome/Edge):**
```bash
flutter run -d chrome
```

**Windows:**
```bash
flutter run -d windows
```

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

## Dependencies

- `flutter_tts`: ^3.8.5 - Text-to-speech
- `speech_to_text`: ^7.3.0 - Speech recognition
- `http`: ^1.5.0 - API requests
- `provider`: ^6.0.5 - State management

## Configuration

### API Key Setup

The app uses Google Gemini API for NLU. Update the API key in `lib/services/nlu_service.dart`:

```dart
final String _apiKey = "YOUR_GEMINI_API_KEY";
```

**Important:** Do not commit your API key to version control. Use environment variables or .env files in production.

## Known Limitations

- Speech recognition: Requires HTTPS in production; works best on Chrome/Chromium browsers
- Text-to-speech: Limited support on web; fully supported on mobile platforms
- Web platform may have reduced performance for real-time audio processing

## Troubleshooting

### "Cannot read properties of undefined" Error
This typically occurs with Material Design localization on older Flutter versions. Solution: Upgrade Flutter to 3.44.4 or later.

### Speech Recognition Not Working
- Ensure microphone permissions are granted
- Use Chrome browser for web version
- Check browser console for CORS or permission errors

### TTS Not Speaking
- Verify speaker/audio output is enabled
- Check browser permissions for audio playback
- Some browsers require user interaction before audio can play

## Future Enhancements

- Emotion detection from voice tone (pitch, speed, emotion in speech)
- Multi-language support
- Conversation history and context memory
- Custom personality settings
- Offline speech recognition

## License

This project is open source and available under the MIT License.

## Support

For issues or questions, please refer to the Flutter documentation:
- [Flutter Docs](https://docs.flutter.dev/)
- [Speech to Text Package](https://pub.dev/packages/speech_to_text)
- [Flutter TTS Package](https://pub.dev/packages/flutter_tts)
