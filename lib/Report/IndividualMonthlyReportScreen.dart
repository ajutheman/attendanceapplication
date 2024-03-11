// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// // Define the custom report screens
//
// class IndividualMonthlyReportScreen extends StatelessWidget {
//   final String employeeId;
//   final DateTime month;
//
//   IndividualMonthlyReportScreen(
//       {required this.employeeId, required this.month});
//
//   get attendanceData => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Individual Monthly Attendance Report'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           Text('Employee ID: $employeeId'),
//           Text('Selected Month: $month'),
//           SizedBox(height: 20),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 elevation: 4,
//                 child: TableCalendar(
//                   focusedDay: month,
//                   firstDay: DateTime(month.year, month.month - 1, 1),
//                   lastDay: DateTime(month.year, month.month + 1, 0),
//                   calendarFormat: CalendarFormat.month,
//                   startingDayOfWeek: StartingDayOfWeek.monday,
//                   weekendDays: [DateTime.saturday, DateTime.sunday],
//                   daysOfWeekVisible: true,
//                   headerStyle: HeaderStyle(
//                     titleCentered: true,
//                   ),
//                   calendarStyle: CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.blue.withOpacity(0.5),
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Colors.blue,
//                       shape: BoxShape.circle,
//                     ),
//                     weekendTextStyle: TextStyle(color: Colors.red),
//                   ),
//                   eventLoader: (day) {
//                     return [attendanceData[day] ?? ''];
//                   },
//                   markersBuilder: (context, day, events, holidays) {
//                     final children = <Widget>[];
//
//                     if (attendanceData[day] == 'Leave') {
//                       children.add(
//                         Positioned(
//                           right: 1,
//                           bottom: 1,
//                           child: Icon(
//                             Icons.highlight_off,
//                             color: Colors.red,
//                             size: 12,
//                           ),
//                         ),
//                       );
//                     } else if (attendanceData[day] == 'Present') {
//                       children.add(
//                         Positioned(
//                           right: 1,
//                           bottom: 1,
//                           child: Icon(
//                             Icons.check_circle,
//                             color: Colors.green,
//                             size: 12,
//                           ),
//                         ),
//                       );
//                     }
//
//                     return children;
//                   },
//                   eventMargin: EdgeInsets.all(2),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: IndividualMonthlyReportScreen(
//       employeeId: '123456',
//       month: DateTime.now(),
//     ),
//   ));
// }
