import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'LoginPage.dart';
import 'User_data_modle.dart';
import 'userData.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<UserDataModel> userdatalist =
      Userdata.userdatalist.cast<UserDataModel>();
  UserDataModel? selectedEmployee;
  TextEditingController pinController = TextEditingController();
  File? capturedImage;

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
        title: Center(child: Text("Attendance")),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: DropdownButton<UserDataModel>(
                value: selectedEmployee,
                icon: const Icon(
                  Icons.arrow_drop_down,
                ),
                iconSize: 50,
                elevation: 27,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.greenAccent,
                ),
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
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  height: 90,
                  width: 170,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: TextField(
                    controller: pinController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'PIN'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (capturedImage != null)
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(capturedImage!),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Container(
              width: 190,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  await takePhoto();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyanAccent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt),
                    SizedBox(width: 8),
                    Text('Take Photo'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await submitAttendance();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyanAccent,
              ),
              child: Text('Mark Attendance'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> takePhoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      setState(() {
        capturedImage = image != null ? File(image.path) : null;
      });
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }

  Future<void> submitAttendance() async {
    try {
      if (selectedEmployee == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select a user.'),
          ),
        );
        return;
      }

      if (pinController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a PIN.'),
          ),
        );
        return;
      }

      if (capturedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please take a photo.'),
          ),
        );
        return;
      }

      if (pinController.text != selectedEmployee!.pin) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect PIN. Please try again.'),
          ),
        );
        return;
      }

      String status;
      int workingDays = selectedEmployee!.workingDays ?? 0;

      DateTime now = DateTime.now();
      DateTime expectedArrivalTime =
          DateTime(now.year, now.month, now.day, 9, 0, 0);

      if (now.isBefore(expectedArrivalTime.add(Duration(minutes: 1)))) {
        status = 'Present';
      } else if (now.isBefore(expectedArrivalTime.add(Duration(minutes: 10)))) {
        status = 'Late';
      } else {
        status = 'Absent';
      }

      workingDays++;

      int index = Userdata.userdatalist
          .indexWhere((element) => element.id == selectedEmployee!.id);
      if (index != -1) {
        Userdata.userdatalist[index].status = status;
        Userdata.userdatalist[index].workingDays = workingDays;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendance marked for ${selectedEmployee!.name}'),
        ),
      );

      // Navigate back to the login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (error) {
      print('Error submitting attendance: $error');
    }
  }
}
