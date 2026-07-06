import 'dart:convert';
import 'package:http/http.dart' as http;

class NLUService {
  final String _apiKey = "AIzaSyBYJyJMBBXIQAKxcedpwl5-RcOPWVvBEbI";

  Future<String> getResponse(String input) async {
    try {
      final url = Uri.parse(
        "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent?key=$_apiKey",
      );

      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                  "You are Aura, a warm, emotional, and intelligent voice assistant. "
                  "You reply with empathy, positivity, and in paragraph form. "
                  "You understand natural human language and respond with thoughtful, soothing words. "
                  "Now, the user said: \"$input\". Please reply in an emotionally engaging, natural tone."
              }
            ]
          }
        ]
      });

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? "";
        return text.isNotEmpty
          ? text
          : "Hmm... I’m here, but I couldn’t quite think of a reply right now.";
      } else {
        print("Error from API: ${response.statusCode}");
        print(response.body);
        return "I’m having trouble connecting to my thoughts right now, but I’m still here with you.";
      }
    } catch (e) {
      print("Exception: $e");
      return "I’m having trouble connecting right now, but I’m still here with you.";
    }
  }
}
