import 'package:flutter/material.dart';

class RiskManagementPage extends StatelessWidget {
  const RiskManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Risk Management'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Risk Management',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 16),
             Text(
              'Streamline your operations and boost efficiency with our powerful risk management tools. From workflow management to process optimization, our AI-driven solutions help you eliminate manual tasks, reduce errors, and focus on high-value activities.',
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
              '• Intelligent Process Automation\n• Robotic Process Automation\n• Workflow Optimization\n• Task Scheduling and Monitoring',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}