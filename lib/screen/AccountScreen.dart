import 'package:flutter/material.dart';

import '../Report/DailyReportScreen.dart';
import '../Report/IndividualDailyReportScreen.dart';
import '../Report/IndividualWeeklyReportScreen.dart';
import '../Report/MonthlyReportScreen.dart';
import '../Report/WeeklyReportScreen.dart';

// Define the custom report screens

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _selectedReport = 'Daily Attendance Report';
  String _selectedEmployee = '';
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  DateTime _selectedMonth = DateTime.now();

  void _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _startDate)
      setState(() {
        _startDate = picked;
      });
  }

  void _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: _startDate,
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _endDate)
      setState(() {
        _endDate = picked;
      });
  }

  void _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedMonth,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null && picked != _selectedMonth)
      setState(() {
        _selectedMonth = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedReport,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReport = newValue!;
                });
              },
              items: <String>[
                'Daily Attendance Report',
                'Weekly Attendance Report',
                'Monthly Attendance Report',
                'Individual Daily Attendance Report',
                'Individual Weekly Attendance Report',
                'Individual Monthly Attendance Report',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            if (_selectedReport.contains('Individual'))
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _selectedEmployee = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter employee ID',
                    labelText: 'Employee ID',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            if (_selectedReport.contains('Weekly'))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => _selectStartDate(context),
                    child: Text(
                        'Select Start Date: ${_startDate.toString().split(' ')[0]}'),
                  ),
                  TextButton(
                    onPressed: () => _selectEndDate(context),
                    child: Text(
                        'Select End Date: ${_endDate.toString().split(' ')[0]}'),
                  ),
                ],
              ),
            if (_selectedReport.contains('Monthly'))
              TextButton(
                onPressed: () => _selectMonth(context),
                child: Text(
                    'Select Month: ${_selectedMonth.toString().split(' ')[0]}'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the appropriate report screen based on the selected report
                switch (_selectedReport) {
                  case 'Daily Attendance Report':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DailyReportScreen()),
                    );
                    break;
                  case 'Weekly Attendance Report':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeeklyReportScreen(
                              startDate: _startDate, endDate: _endDate)),
                    );
                    break;
                  case 'Monthly Attendance Report':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MonthlyReportScreen(month: _selectedMonth)),
                    );
                    break;
                  case 'Individual Daily Attendance Report':
                    if (_selectedEmployee.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualDailyReportScreen(
                                  employeeId: _selectedEmployee,
                                )),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Please enter employee ID.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    break;
                  case 'Individual Weekly Attendance Report':
                    if (_selectedEmployee.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualWeeklyReportScreen(
                                  employeeId: _selectedEmployee,
                                )),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Please enter employee ID.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    break;
                  case 'Individual Monthly Attendance Report':
                    if (_selectedEmployee.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualWeeklyReportScreen(
                                  employeeId: _selectedEmployee,
                                )
                            // ),
                            //     IndividualMonthlyReportScreen(
                            //   employeeId: _selectedEmployee,
                            //   month: _selectedMonth,
                            // ),
                            ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Please enter employee ID.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    break;
                  // Add cases for other report types as needed
                }
              },
              child: Text('View Report'),
            ),
          ],
        ),
      ),
    );
  }
}
