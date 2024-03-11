import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Modle/User_data_modle.dart';
import '../../Modle/userData.dart';
import '../attendanceMarkingPage.dart';

class CustomIcon {
  final String imagePath;
  final String label;
  final Color color; // Corrected parameter name from 'color' to 'color'

  // Constructor with required parameters and default values
  CustomIcon(
      {required this.imagePath,
      required this.label,
      required this.color}); // Removed 'colore' and replaced with 'color'
}

// Updated list of custom icons
List<CustomIcon> customIcons = [
  CustomIcon(
      imagePath: 'lib/assets/icons8-box-512.png',
      label: '  ABSENT',
      color: Colors.red), // Fixed parameter name from 'colore' to 'color'
  CustomIcon(
      imagePath: 'lib/assets/icons8-boxgreen.png',
      label: 'PRESENT',
      color: Colors.green), // Added color parameter value
  CustomIcon(
      imagePath: 'lib/assets/icons8-box-512 paruple.png',
      label: 'PAID LEAVE',
      color: Colors.purpleAccent), // Added color parameter value
  CustomIcon(
      imagePath: 'lib/assets/icons8-box-512 gray.png',
      label: 'DAYOFF',
      color: Colors.grey), // Added color parameter value
  CustomIcon(
      imagePath: 'lib/assets/icons8-box-512 (5).png',
      label: '  HALF DAY LEAVE',
      color: Colors.yellow), // Added color parameter value
  CustomIcon(
      imagePath: 'lib/assets/icons8-box-128.png',
      label: 'UNPAID LEAVE',
      color: Colors.blue), // Added color parameter value
];

class AttendanceDataModel {
  final int day;
  final String status;

  AttendanceDataModel({required this.day, required this.status});
}

class viewAttendanceIndule extends StatefulWidget {
  @override
  _viewAttendanceInduleState createState() => _viewAttendanceInduleState();
}

class _viewAttendanceInduleState extends State<viewAttendanceIndule> {
  int _selectedMonth = DateTime.now().month;
  int _selectedYear = DateTime.now().year;
  List<UserDataModel> userdatalist =
      Userdata.userdatalist.cast<UserDataModel>();
  List<List<AttendanceDataModel>> _attendanceData = List.generate(
    12, // 12 months
    (index) => [], // Initialize each month with an empty list
  );
  UserDataModel? selectedEmployee;
  AttendanceOption? selectedOption;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            double screenHeight = sizingInformation.screenSize.height;

            if (screenWidth >= 768 || orientation == Orientation.landscape) {
              // Tablet and desktop layout
              return _buildDesktopLayout();
            } else {
              // Mobile layout
              return _buildMobileLayout();
            }
          },
        );
      },
    );
    // return ResponsiveBuilder(
    //   builder: (context, sizingInformation) {
    //     if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
    //       return _buildDesktopLayout();
    //     } else if (sizingInformation.deviceScreenType ==
    //         DeviceScreenType.tablet) {
    //       return _buildTabletLayout();
    //     } else {
    //       return _buildMobileLayout();
    //     }
    //   },
    // );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildEmployeeList(),
                GridView.count(
                  crossAxisCount: 5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  children: customIcons.map((icon) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: icon.color,
                        elevation: 10,
                        child: Center(
                          child: Text(
                            icon.label,
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: _buildAttendanceView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          _buildEmployeeList(),
          Expanded(
            child: _buildAttendanceView(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          _buildEmployeeList(),
          Expanded(child: _buildAttendanceView()),
        ],
      ),
    );
  }

  Widget _buildEmployeeList() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(10.0),
                child: DropdownButton<UserDataModel>(
                  value: selectedEmployee,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 26,
                  elevation: 7,
                  style: const TextStyle(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(2),
                  focusColor: Colors.greenAccent,
                  hint: Text("Select from the list",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onChanged: (UserDataModel? newValue) {
                    setState(() {
                      selectedEmployee = newValue;
                    });
                  },
                  items: userdatalist.map((UserDataModel userData) {
                    return DropdownMenuItem<UserDataModel>(
                      value: userData,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          userData.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceView() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          // For larger screens (e.g., tablets and desktops)
          return _buildAttendanceViewLarge();
        } else {
          // For smaller screens (e.g., mobile devices)
          return _buildAttendanceViewSmall();
        }
      },
    );
  }

  Widget _buildAttendanceViewLarge() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    DateFormat('MMMM yyyy')
                        .format(DateTime(_selectedYear, _selectedMonth)),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left,
                            color: Colors.grey, size: 50),
                        onPressed: () {
                          updateMonth(-1);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right,
                            color: Colors.grey, size: 50),
                        onPressed: () {
                          updateMonth(1);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      return Text(
                        DateFormat('EEE').format(
                            DateTime(_selectedYear, _selectedMonth, index + 1)),
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      );
                    }),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 7,
                  children: List.generate(
                    _getNumberOfDaysInMonth(_selectedYear, _selectedMonth),
                    (index) => _buildDayTile(index + 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Attendance Summary'),
                  subtitle: Text(
                      'Present: 0, Absent: 25, Half Day: 0, Paid Leave: 0.0'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: customIcons.map((icon) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: icon.color,
                  elevation: 10,
                  child: Center(
                    child: Text(
                      icon.label,
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceViewSmall() {
    // Implement the layout for smaller screens (e.g., mobile devices)
    // Return a different layout suitable for smaller screens
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    DateFormat('MMMM yyyy')
                        .format(DateTime(_selectedYear, _selectedMonth)),
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left, color: Colors.grey),
                        onPressed: () {
                          updateMonth(-1);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right, color: Colors.grey),
                        onPressed: () {
                          updateMonth(1);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      return Text(
                        DateFormat('EEE').format(
                            DateTime(_selectedYear, _selectedMonth, index + 1)),
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      );
                    }),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 7,
                  children: List.generate(
                    _getNumberOfDaysInMonth(_selectedYear, _selectedMonth),
                    (index) => _buildDayTile(index + 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Attendance Summary'),
                  subtitle: Text(
                      'Present: 0, Absent: 25, Half Day: 0, Paid Leave: 0.0'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: customIcons.map((icon) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: icon.color,
                  elevation: 10,
                  child: Center(
                    child: Text(
                      icon.label,
                      style: TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayTile(int day) {
    Color backgroundColor = Colors.grey;
    var attendanceDay = _attendanceData[_selectedMonth - 1].firstWhere(
      (element) => element.day == day,
      orElse: () => AttendanceDataModel(day: -1, status: ''),
    );

    if (attendanceDay.day != -1) {
      String status = attendanceDay.status;
      switch (status) {
        case 'present':
          backgroundColor = Colors.lightGreen;
          break;
        case 'absent':
          backgroundColor = Colors.red;
          break;
        case 'half_day':
          backgroundColor = Colors.yellow;
          break;
        case 'day_off':
          backgroundColor = Colors.grey;
          break;
        case 'LATE':
          backgroundColor = Colors.green;
          break;
        case 'Paid Leave':
          backgroundColor = Colors.purpleAccent;
          break;
        case 'UNPaid Leave':
          backgroundColor = Colors.blue;
          break;
      }
    }

    return Container(
      width: 20,
      height: 20,
      child: Card(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('$day', style: TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }

  void updateMonth(int increment) {
    setState(() {
      _selectedMonth += increment;
      if (_selectedMonth < 1) {
        _selectedMonth = 12;
        _selectedYear--;
      } else if (_selectedMonth > 12) {
        _selectedMonth = 1;
        _selectedYear++;
      }
      fetchAttendanceData(_selectedYear, _selectedMonth);
    });
  }

  int _getNumberOfDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  Future<void> fetchAttendanceData(int year, int month) async {
    _attendanceData[_selectedMonth - 1].clear();

    _attendanceData[_selectedMonth - 1] = [
      AttendanceDataModel(day: 1, status: 'absent'),
      AttendanceDataModel(day: 2, status: 'absent'),
      AttendanceDataModel(day: 3, status: 'absent'),
      AttendanceDataModel(day: 4, status: 'day_off'),
      AttendanceDataModel(day: 5, status: 'present'),
      AttendanceDataModel(day: 6, status: 'present'),
      AttendanceDataModel(day: 7, status: 'present'),
      AttendanceDataModel(day: 8, status: 'present'),
      AttendanceDataModel(day: 9, status: 'present'),
      AttendanceDataModel(day: 10, status: 'half_day'),
      AttendanceDataModel(day: 11, status: 'half_day'),
      AttendanceDataModel(day: 12, status: 'half_day'),
      AttendanceDataModel(day: 13, status: 'half_day'),
      AttendanceDataModel(day: 14, status: 'half_day'),
      AttendanceDataModel(day: 15, status: 'half_day'),
      AttendanceDataModel(day: 16, status: 'half_day'),
      AttendanceDataModel(day: 17, status: 'LATE'),
      AttendanceDataModel(day: 18, status: 'Paid Leave'),
      AttendanceDataModel(day: 19, status: 'Paid Leave'),
      AttendanceDataModel(day: 20, status: 'Paid Leave'),
    ];
  }
}
