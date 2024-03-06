import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Analytics',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 16),
             Text(
              'Our advanced analytics tools provide you with valuable insights into your business operations, customer behavior, and market trends. With real-time data visualization and customizable dashboards, you can make data-driven decisions and optimize your strategies for maximum impact.',
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
              '• Predictive Analytics\n• Customer Segmentation\n• Forecasting and Trend Analysis\n• Real-time Reporting',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}