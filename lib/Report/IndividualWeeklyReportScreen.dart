import 'package:flutter/material.dart';

// Define the custom report screens

class IndividualWeeklyReportScreen extends StatelessWidget {
  final String employeeId;

  IndividualWeeklyReportScreen({required this.employeeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Weekly Attendance Report'),
      ),
      body: Center(
        child: Text('Employee ID: $employeeId'),
      ),
    );
  }
}
