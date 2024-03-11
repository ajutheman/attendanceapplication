import 'package:flutter/material.dart';

// Define the custom report screens

class IndividualDailyReportScreen extends StatelessWidget {
  final String employeeId;

  IndividualDailyReportScreen({required this.employeeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Daily Attendance Report'),
      ),
      body: Center(
        child: Text('Employee ID: $employeeId'),
      ),
    );
  }
}
