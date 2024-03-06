import 'package:flutter/material.dart';

class IntegrationPage extends StatelessWidget {
  const IntegrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integration'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Integration',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 16),
             Text(
              'Our Business AI SaaS solution seamlessly integrates with your existing systems and third-party applications, ensuring a unified and efficient workflow. Experience the power of AI-driven automation and insights across your organization.',
              style: TextStyle(fontSize: 16),
            ),
             SizedBox(height: 16),
             Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
             Text(
              '• API Integration\n• Database Connectivity\n• Cloud Integration\n• Legacy System Integration',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}