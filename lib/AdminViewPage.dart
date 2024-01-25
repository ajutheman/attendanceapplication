import 'package:flutter/material.dart';
import 'package:untitled9/userData.dart';

import 'LoginPage.dart';
import 'User_data_modle.dart';

class AdminViewPage extends StatefulWidget {
  @override
  _AdminViewPageState createState() => _AdminViewPageState();
}

class _AdminViewPageState extends State<AdminViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          size: 26.0,
        ),
        title: Center(child: Text("Admin View Page")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            // Navigate to the login page
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Live Attendees'),
                Tab(text: 'Monthly Attendance'),
                Tab(text: 'Monthly Leave'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LiveAttendeesTab(),
                  MonthlyReportTab(reportType: 'Attendance'),
                  MonthlyReportTab(reportType: 'Leave'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveAttendeesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Userdata.userdatalist.length,
      itemBuilder: (context, index) {
        UserDataModel userData = Userdata.userdatalist[index];

        // Define colors based on status
        Color statusColor = Colors.black; // Default color
        if (userData.status == 'Present') {
          statusColor = Colors.green; // Green for 'Present'
        } else if (userData.status == 'Absent') {
          statusColor = Colors.red; // Red for 'Absent'
        } else if (userData.status == 'Late') {
          statusColor = Colors.orange; // Orange for 'Late'
        }

        return ListTile(
          title: Text(
            userData.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.account_circle_rounded, color: statusColor),
          subtitle: Text(
            'Status: ${userData.status}',
            style: TextStyle(
              color: statusColor,
            ),
          ),
        );
      },
    );
  }
}

class MonthlyReportTab extends StatelessWidget {
  final String reportType;

  MonthlyReportTab({required this.reportType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Userdata.userdatalist.length,
      itemBuilder: (context, index) {
        UserDataModel userData = Userdata.userdatalist[index];
        return ListTile(
          title: Text(userData.name),
          subtitle: Text('$reportType: ${userData.workingDays} days'),
        );
      },
    );
  }
}
