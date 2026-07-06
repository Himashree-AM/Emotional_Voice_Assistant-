class AnalysisResult {
  final String transcription;
  final double sentimentScore; // -1.0 .. +1.0
  final String emotion; // e.g. "happy", "sad", "angry", "neutral"
  final String intent; // short intent label
  final String response; // generated reply text

  AnalysisResult({
    required this.transcription,
    required this.sentimentScore,
    required this.emotion,
    required this.intent,
    required this.response,
  });
}
