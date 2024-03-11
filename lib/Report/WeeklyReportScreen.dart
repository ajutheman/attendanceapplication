import 'package:flutter/material.dart';

class WeeklyReportScreen extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  WeeklyReportScreen({required this.startDate, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Attendance Report'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Start Date: $startDate'),
            Text('End Date: $endDate'),
          ],
        ),
      ),
    );
  }
}
