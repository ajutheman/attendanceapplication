import 'package:flutter/material.dart';
import 'package:untitled9/Modle/userData.dart';

import '../../Modle/User_data_modle.dart';
import '../../loginScren.dart';

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
                builder: (context) => home(),
                // LoginPage(),
              ),
            );
          },
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(height: 10),
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
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

        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              onTap: () {
                // Navigate to user detail page
                // You can implement this functionality
              },
              title: Text(
                userData.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: statusColor,
                child: Icon(Icons.account_circle_rounded, color: Colors.white),
              ),
              subtitle: Text(
                'Status: ${userData.status}  pin:${userData.pin}',
                style: TextStyle(
                  color: statusColor,
                ),
              ),
              // tileColor: statusColor,
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
        return Card(
          child: ListTile(
            title: Text(userData.name),
            subtitle: Text('$reportType: ${userData.workingDays} days'),
          ),
        );
      },
    );
  }
}
