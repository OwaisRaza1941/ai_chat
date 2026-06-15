import 'dart:convert';
import 'package:http/http.dart' as http;

class AIChatServices {

  /// API KEY
  final String apiKey = ' ';

  //// Send Messege IN Qroq Ai
  Future<String> sendMessage(String prompt) async {
    try {
      /// Request Send
      final response = await http.post(
        Uri.parse('https://api.groq.com/openai/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "llama-3.1-8b-instant",
          "messages": [
            {"role": "user", "content": prompt},
          ],
        }),
      );

      /// Check response to jsonDecode and return erro
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data['choices'][0]['message']['content'];
      }

      return "Error: ${response.body}";
    } catch (e) {
      return "Exception: $e";
    }
  }
}
