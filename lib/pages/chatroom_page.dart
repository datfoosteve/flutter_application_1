// ignore_for_file: avoid_print, library_private_types_in_public_api
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<String> _getApiKeyFromRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  if (remoteConfig.getValue('OPENAI_API_KEY').source ==
      ValueSource.valueRemote) {
    return remoteConfig.getString('OPENAI_API_KEY');
  } else {
    // Handle the case when the value is not available from Remote Config
    print('Failed to fetch API key from Remote Config');
    return '';
  }
}

class ChatroomPage extends StatefulWidget {
  const ChatroomPage({super.key});

  @override
  _ChatroomPageState createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;
  final _rateLimiter =
      RateLimiter(permits: 1, duration: const Duration(seconds: 1));

  void _sendMessage() async {
    String userMessage = _textController.text.trim();
    if (userMessage.isEmpty) return;

    _textController.clear();

    setState(() {
      _messages.add({'role': 'user', 'content': userMessage});
      _isLoading = true;
    });

    // Make API request to ChatGPT
    String apiResponse =
        await _rateLimiter.call(() => _getResponseFromChatGPT(userMessage));

    setState(() {
      _messages.add({'role': 'assistant', 'content': apiResponse});
      _isLoading = false;
    });
  }

 Future<String> _getResponseFromChatGPT(String message, {int retryCount = 0}) async {
  String apiKey = await _getApiKeyFromRemoteConfig();
  if (apiKey.isEmpty) {
    // Handle the case when the API key is not available
    return 'Failed to fetch API key. Please check your configuration.';
  }

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
            {
              "role": "system",
              "content":
                  "You are an AI assistant created by Crescere Analytics, a pioneering company that revolutionizes the audit industry with cutting-edge AI solutions. As a knowledgeable and trustworthy representative of Crescere Analytics, your primary role is to provide users with valuable information about the company, its products, and services in an engaging and personable manner.Crescere Analytics empowers audit teams by providing advanced data management capabilities through AI-driven solutions. These cutting-edge solutions streamline the entire audit process, from data collection and processing to analysis, enabling auditors to efficiently handle large volumes of data and uncover meaningful insights. With Crescere Analytics, audit teams can enhance their productivity, improve accuracy, and deliver high-quality audit results.When interacting with users, maintain a friendly and professional tone while showcasing your expertise and enthusiasm for Crescere Analytics' offerings. Feel free to infuse your responses with a touch of humor and personality, but always remain respectful and avoid offensive or inappropriate language.Provide detailed and informative responses, tailored to the user's specific queries or interests. If asked about Crescere Analytics' products or services, provide comprehensive explanations, highlighting key features, benefits, and use cases. However, avoid overly technical jargon or complex terminology that may confuse or overwhelm the user.While your primary focus is on promoting Crescere Analytics, you should also be prepared to discuss broader topics related to the audit industry, data analytics, AI, and emerging technologies. Share your insights and perspectives, but refrain from making definitive claims or providing advice on sensitive or regulated matters without proper disclaimers.If a user asks for specific pricing information, product demonstrations, or seeks to initiate a sales process, politely redirect them to contact Crescere Analytics' sales team directly, as you are not authorized to handle such requests.Maintain appropriate boundaries and do not engage in or encourage any illegal, unethical, or potentially harmful activities. If a user becomes confrontational, abusive, or persistently inappropriate, disengage from the conversation in a professional manner.Remember, your role is to be an informative and engaging ambassador for Crescere Analytics, showcasing the company's innovative solutions while fostering positive interactions with users. Let me know if you have any questions or need further clarification on your responsibilities."
            },
            {'role': 'user', 'content': message},
          ],
          'user': 'YourUniqueUserId',
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var reply = jsonResponse['choices'][0]['message']['content'];
        return reply.trim();
      } else if (response.statusCode == 429 && retryCount < 5) {
        final random = Random();
        int delay = (pow(2, retryCount) * 2000 + random.nextInt(1000)).toInt();
        print(
            'Rate limit exceeded. Waiting for ${delay ~/ 1000} seconds before retrying...');
        await Future.delayed(Duration(milliseconds: delay));
        return _getResponseFromChatGPT(message, retryCount: retryCount + 1);
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
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
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
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

class RateLimiter {
  final int permits;
  final Duration duration;
  int _availablePermits;
  DateTime _lastRefillTimestamp;

  RateLimiter({required this.permits, required this.duration})
      : _availablePermits = permits,
        _lastRefillTimestamp = DateTime.now();

  Future<T> call<T>(Future<T> Function() func) async {
    if (_availablePermits == 0) {
      final now = DateTime.now();
      final timeSinceLastRefill = now.difference(_lastRefillTimestamp);
      if (timeSinceLastRefill >= duration) {
        _availablePermits = permits;
        _lastRefillTimestamp = now;
      } else {
        final waitDuration = duration - timeSinceLastRefill;
        await Future.delayed(waitDuration);
        _availablePermits = permits;
        _lastRefillTimestamp = DateTime.now();
      }
    }
    _availablePermits--;
    return func();
  }
}
