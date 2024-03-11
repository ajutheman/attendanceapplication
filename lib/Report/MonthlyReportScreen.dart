import 'package:flutter/material.dart';

// Define the custom report screens

class MonthlyReportScreen extends StatelessWidget {
  final DateTime month;

  MonthlyReportScreen({required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Attendance Report'),
      ),
      body: Center(
        child: Text('Selected Month: $month'),
      ),
    );
  }
}
