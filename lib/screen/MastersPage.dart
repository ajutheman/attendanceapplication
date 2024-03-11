// masters_page.dart
import 'package:flutter/material.dart';

import '../Modle/User_data_modle.dart';
import '../Modle/userData.dart';
import '../loginScren.dart';
import 'EmployeeDetailPage.dart';

class MastersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 26.0,
        ),
        title: Center(child: Text("Employee Profiles")),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            // Navigate to the login page
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => home()
                  // LoginPage(),
                  ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: Userdata.userdatalist.length,
        itemBuilder: (context, index) {
          UserDataModel user =
              Userdata.userdatalist[index]; // Correct variable type
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              title: Text(
                user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.0),
                  Text(
                    'ID: ${user.id}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Designation: ${user.designation}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Contact Info: ${user.contactInformation}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Office Timing: ${user.officeTiming}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeDetailPage(user: user),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
