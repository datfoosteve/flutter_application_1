// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatroomPage extends StatefulWidget {
  const ChatroomPage({super.key});

  @override
  _ChatroomPageState createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() async {
    String userMessage = _textController.text;
    _textController.clear();

    setState(() {
      _messages.add({'role': 'user', 'content': userMessage});
    });

    // Make API requests to multiple APIs
    List<String> apiResponses = await Future.wait([
      _getResponseFromChatGPT(userMessage),
      // _getResponseFromClaude(userMessage),
      // _getResponseFromGemini(userMessage),
      // _getResponseFromGrok(userMessage),
      // _getResponseFromPerplexity(userMessage),
      // Add more API requests as needed
    ]);

    // Summarize the API responses using ChatGPT
    String summary = await _summarizeResponses(apiResponses);

    setState(() {
      _messages.add({'role': 'assistant', 'content': summary});
    });
  }

  Future<String> _getResponseFromChatGPT(String message) async {
  String apiKey = ''; //api key that doesnt work so yeah
  String endpoint = 'https://api.openai.com/v1/chat/completions';

  try {
    var response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4-turbo-preview',
        'messages': [
          {'role': 'system', 'content': 'You are a Crescere Analytics AI Assistant, Right now Employeed by Stephen Puthenpurackal, Give the User information pertaining to the Company. [Info on company:Crescere Analytics empowers audit teams with advanced data management capabilities. Our AI-driven solutions streamline data collection, processing, and analysis, enabling auditors to efficiently handle large volumes of data and uncover valuable insights.]'},
          {'role': 'user', 'content': message},
        ],
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var reply = jsonResponse['choices'][0]['message']['content'];
      return reply;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return 'Error occurred while getting response from ChatGPT';
    }
  } catch (e) {
    print('Error: $e');
    return 'Error occurred while getting response from ChatGPT';
  }
}

  // Future<String> _getResponseFromClaude(String message) async {
  //   // Implement the API request logic for Claude
  //   // Return the response from Claude
  // }

  // Future<String> _getResponseFromGemini(String message) async {
  //   // Implement the API request logic for Gemini
  //   // Return the response from Gemini
  // }

  // Future<String> _getResponseFromGrok(String message) async {
  //   // Implement the API request logic for Grok
  //   // Return the response from Grok
  // }

  // Future<String> _getResponseFromPerplexity(String message) async {
  //   // Implement the API request logic for Perplexity
  //   // Return the response from Perplexity
  // }

 Future<String> _summarizeResponses(List<String> responses) async {
  // Implement the summarization logic using ChatGPT
  // For example, you can make an API request to ChatGPT with the responses
  // and return the summarized response
  // You can use the 'http' package to make the API request
  // Replace the placeholders with your actual implementation
  return 'Summarized response from ChatGPT';
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatroom'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message['content']!),
                  subtitle: Text(message['role']!),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
