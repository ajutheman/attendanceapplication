import 'package:flutter/material.dart';

import 'MastersPage.dart';
import 'User_data_modle.dart';

class EmployeeDetailPage extends StatelessWidget {
  final UserDataModel user;

  EmployeeDetailPage({required this.user});

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
        title: Center(child: Text("Employee Details")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            // Navigate to the login page
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MastersPage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            SizedBox(height: 20.0),
            Text(
              user.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'ID: ${user.id}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Designation: ${user.designation}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Contact Info: ${user.contactInformation}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            Text(
              'Office Timing: ${user.officeTiming}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
