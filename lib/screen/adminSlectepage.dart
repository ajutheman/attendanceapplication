// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../Modle/User_data_modle.dart';
// import '../Modle/userData.dart';
// import '../loginScren.dart';
// import 'AdminViewPage.dart';
// import 'ViewAttendance.dart';
//
// int _selectedMonth = DateTime.now().month;
// int _selectedYear = DateTime.now().year;
// List<List<AttendanceDataModel>> _attendanceData = List.generate(
//   12, // 12 months
//   (index) => [], // Initialize each month with an empty list
// );
//
// class adminSlectPage extends StatefulWidget
// {
//   const adminSlectPage({super.key});
//
//   @override
//   State<adminSlectPage> createState() => _adminSlectPageState();
// }
//
// class _adminSlectPageState extends State<adminSlectPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.grey,
//           size: 26.0,
//         ),
//         title: Center(child: Text("Admin View Page")),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
//           onPressed: () {
//             // Navigate to the login page
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => home(),
//                 // LoginPage(),
//               ),
//             );
//           },
//         ),
//       ),
//       body: DefaultTabController(
//         length: 3,
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             TabBar(
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.grey,
//               indicatorColor: Colors.black,
//               tabs: [
//                 Tab(text: 'Live Attendees'),
//                 Tab(text: 'Monthly Attendance'),
//                 Tab(text: 'Monthly Leave'),
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   LiveAttendeesTab(),
//                   MonthlyReportTab(reportType: 'Attendance'),
//                   MonthlyReportTab(reportType: 'Leave'),
//                   MonthlyReportindule(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MonthlyReportindule extends StatelessWidget {
//   UserDataModel? selectedEmployee;
//
//   List<UserDataModel> userdatalist =
//       Userdata.userdatalist.cast<UserDataModel>();
//
//   // final String reportType;
//   //
//   // MonthlyReportTab({required this.reportType});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//           child: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           SizedBox(height: 20),
//           Container(
//             height: 50,
//             color: Colors.blue,
//           ),
//           Container(
//             height: 80,
//             width: MediaQuery.of(context).size.width / 1.5,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15.0),
//               border: Border.all(
//                 color: Colors.grey,
//               ),
//             ),
//             // padding: EdgeInsets.all(10.0),
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               padding: EdgeInsets.all(10.0),
//               // decoration: BoxDecoration(
//               //   borderRadius: BorderRadius.circular(15.0),
//               //   border: Border.all(
//               //     color: Colors.black,
//               //   ),
//               // ),
//               child: DropdownButton<UserDataModel>(
//                 value: selectedEmployee,
//                 icon: const Icon(
//                   Icons.arrow_drop_down,
//                 ),
//                 iconSize: 26,
//                 elevation: 7,
//                 style: const TextStyle(color: Colors.deepPurple),
//                 // underline: Container(
//                 //   height: 1,
//                 //   color: Colors.transparent,
//                 // ),
//                 borderRadius: BorderRadius.circular(2),
//                 focusColor: Colors.greenAccent,
//                 hint: Text("Select from the list",
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 onChanged: (UserDataModel? newValue) {
//
//                   setState(()
//                   {
//                     selectedEmployee = newValue;
//                   });
//                 },
//                 items: userdatalist.map((UserDataModel userData) {
//                   return DropdownMenuItem<UserDataModel>(
//                     value: userData,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8.0),
//                       child: Text(
//                         userData.name,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           SizedBox(width: 20),
//           Column(
//             children: [
//               Card(
//                 child: Column(
//                   children: [
//                     ListTile(
//                       title: Text(
//                         DateFormat('MMMM yyyy')
//                             .format(DateTime(_selectedYear, _selectedMonth)),
//                         style: TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.chevron_left, color: Colors.grey),
//                             onPressed: () {
//                               updateMonth(-1);
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.chevron_right, color: Colors.grey),
//                             onPressed: () {
//                               updateMonth(1);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: List.generate(7, (index) {
//                           return Text(
//                             DateFormat('EEE').format(DateTime(
//                                 _selectedYear, _selectedMonth, index + 1)),
//                             style:
//                                 TextStyle(fontSize: 14.0, color: Colors.grey),
//                           );
//                         }),
//                       ),
//                     ),
//                     GridView.count(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       crossAxisCount: 7,
//                       children: List.generate(
//                         _getNumberOfDaysInMonth(_selectedYear, _selectedMonth),
//                         (index) => _buildDayTile(index + 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Card(
//                 child: Column(
//                   children: [
//                     ListTile(
//                       title: Text('Attendance Summary'),
//                       subtitle: Text(
//                           'Present: 0, Absent: 25, Half Day: 0, Paid Leave: 0.0'),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               GridView.count(
//                 crossAxisCount: 3, // Number of columns in the grid
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//                 shrinkWrap: true,
//                 children: customIcons.map((icon) {
//                   return GestureDetector(
//                     onTap: () {
//                       // Handle icon selection
//                     },
//                     child: Container(
//                       // width: 20,
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25.0),
//                         border: Border.all(
//                           color: Colors.grey,
//                         ),
//                       ),
//                       padding: EdgeInsets.all(10.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Custom PNG icon images
//                           Text(
//                             icon.label,
//                             style: const TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.w900,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Image.asset(
//                             icon.imagePath,
//                             width: 99, // Adjust the size of the icon as needed
//                             height: 70,
//                           ),
//                           // SizedBox(height: 5),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//         ]),
//       )),
//     );
//   }
//
//   Widget _buildDayTile(int day) {
//     Color backgroundColor =
//         Colors.grey; // Default color for days without attendance data
//     var attendanceDay = _attendanceData[_selectedMonth - 1].firstWhere(
//       (element) => element.day == day,
//       orElse: () =>
//           AttendanceDataModel(day: -1, status: ''), // Return a default instance
//     );
//
//     if (attendanceDay.day != -1) {
//       String status = attendanceDay.status;
//       switch (status) {
//         case 'present':
//           backgroundColor = Colors.lightGreen;
//           break;
//         case 'absent':
//           backgroundColor = Colors.red;
//           break;
//         case 'half_day':
//           backgroundColor = Colors.yellow;
//           break;
//         case 'day_off':
//           backgroundColor = Colors.grey;
//           break;
//         case 'LATE':
//           backgroundColor = Colors.green;
//           break;
//         case 'Paid Leave':
//           backgroundColor = Colors.purpleAccent;
//           break;
//         case 'UNPaid Leave':
//           backgroundColor = Colors.blue;
//           break;
//         // Add more cases for other attendance statuses if needed
//       }
//     }
//
//     return Card(
//       color: backgroundColor,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Text('$day', style: TextStyle(fontSize: 16.0)),
//             // You can add more information about the attendance status here if needed
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   void updateMonth(int increment) {
//     setState(() {
//       _selectedMonth += increment;
//       if (_selectedMonth < 1) {
//         _selectedMonth = 12;
//         _selectedYear--;
//       } else if (_selectedMonth > 12) {
//         _selectedMonth = 1;
//         _selectedYear++;
//       }
//       fetchAttendanceData(_selectedYear, _selectedMonth);
//     });
//   }
//
//   int _getNumberOfDaysInMonth(int year, int month) {
//     return DateTime(year, month + 1, 0).day;
//   }
//
//   Future<void> fetchAttendanceData(int year, int month) async {
//     // Database query to fetch attendance data for the specified month and year
//     // Here, we're just populating _attendanceData with dummy data
//
//     // Clear previous data
//     _attendanceData[_selectedMonth - 1].clear();
//
//     // Add data for the selected month
//     _attendanceData[_selectedMonth - 1] = [
//       AttendanceDataModel(day: 1, status: 'absent'),
//       AttendanceDataModel(day: 2, status: 'absent'),
//       AttendanceDataModel(day: 3, status: 'absent'),
//       AttendanceDataModel(day: 4, status: 'day_off'),
//       AttendanceDataModel(day: 5, status: 'present'),
//       AttendanceDataModel(day: 6, status: 'present'),
//       AttendanceDataModel(day: 7, status: 'present'),
//       AttendanceDataModel(day: 8, status: 'present'),
//       AttendanceDataModel(day: 9, status: 'present'),
//       AttendanceDataModel(day: 10, status: 'half_day'),
//       AttendanceDataModel(day: 11, status: 'half_day'),
//       AttendanceDataModel(day: 12, status: 'half_day'),
//       AttendanceDataModel(day: 13, status: 'half_day'),
//       AttendanceDataModel(day: 14, status: 'half_day'),
//       AttendanceDataModel(day: 15, status: 'half_day'),
//       AttendanceDataModel(day: 16, status: 'half_day'),
//       AttendanceDataModel(day: 17, status: 'LATE'),
//       AttendanceDataModel(day: 18, status: 'Paid Leave'),
//       AttendanceDataModel(day: 19, status: 'Paid Leave'),
//       AttendanceDataModel(day: 20, status: 'Paid Leave'),
//       // Add more data as needed
//     ];
//   }
// }
