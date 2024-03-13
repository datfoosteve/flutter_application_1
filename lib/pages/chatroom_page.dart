// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'dart:math';
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
  bool _isLoading = false;

  void _sendMessage() async {
    String userMessage = _textController.text;
    _textController.clear();

    setState(() {
      _messages.add({'role': 'user', 'content': userMessage});
      _isLoading = true;
    });

    // Make API request to ChatGPT
    String apiResponse = await _getResponseFromChatGPT(userMessage);

    setState(() {
      _messages.add({'role': 'assistant', 'content': apiResponse});
      _isLoading = false;
    });
  }

  Future<String> _getResponseFromChatGPT(String message, {int retryCount = 0}) async {
    String apiKey = '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';
    String endpoint = 'https://api.openai.com/v1/chat/completions';

    try {
      var response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'user', 'content': message},
          ],
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var reply = jsonResponse['choices'][0]['message']['content'];
        return reply.trim();
      } else if (response.statusCode == 429 && retryCount < 3) {
        int delay = (pow(2, retryCount) * 1000).toInt(); // Cast to int
        print('Rate limit exceeded. Waiting for ${delay ~/ 1000} seconds before retrying...');
        await Future.delayed(Duration(milliseconds: delay));
        return _getResponseFromChatGPT(message, retryCount: retryCount + 1);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return 'Sorry, something went wrong. Please try again later.';
      }
    } catch (e) {
      print('Error: $e');
      return 'Sorry, something went wrong. Please try again later.';
    }
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
                final isUserMessage = message['role'] == 'user';
                return ChatBubble(
                  message: message['content']!,
                  isUserMessage: isUserMessage,
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}