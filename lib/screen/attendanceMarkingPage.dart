import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Modle/User_data_modle.dart';
import '../Modle/userData.dart';
import 'Admin/ViewAttendance.dart';

enum AttendanceOption {
  CheckIn,
  CheckOut,
  MeetingIn,
  MeetingOut,
}

class CustomIcon {
  final String imagePath;
  final String label;

  CustomIcon({required this.imagePath, required this.label});
}

List<CustomIcon> customIcons = [
  CustomIcon(imagePath: 'lib/assets/icons8-check-in-64.png', label: 'CheckIn'),
  CustomIcon(imagePath: 'lib/assets/icons8-check-out.png', label: 'CheckOut'),
  CustomIcon(imagePath: 'lib/assets/icons8-meeting_in.png', label: 'MeetingIn'),
  CustomIcon(
      imagePath: 'lib/assets/icons8-leave-house-48.png', label: 'MeetingOut'),

  // Add more custom icons as needed
];
// Define a list of icons or images corresponding to each AttendanceOption
final List<Widget> optionIcons = [
  Icon(Icons.home),
  Icon(Icons.work),
  Icon(Icons.school),
  Icon(Icons.favorite),
  // Add more icons or images here
];

class AttendancePagemark extends StatefulWidget {
  @override
  _AttendancePagemarkState createState() => _AttendancePagemarkState();
}

class _AttendancePagemarkState extends State<AttendancePagemark> {
  List<UserDataModel> userdatalist =
      Userdata.userdatalist.cast<UserDataModel>();
  UserDataModel? selectedEmployee;
  TextEditingController pinController = TextEditingController();
  File? capturedImage;
  AttendanceOption? selectedOption;

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
                builder: (context) => viewAttendanceIndule(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(width: 4),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      // padding: EdgeInsets.all(10.0),
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
                    SizedBox(width: 20),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: DropdownButton<AttendanceOption>(
                        value: selectedOption,
                        hint: Text("Select  "),
                        onChanged: (AttendanceOption? newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                        items: AttendanceOption.values.map((option) {
                          return DropdownMenuItem<AttendanceOption>(
                            value: option,
                            child: Text(option.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  children: customIcons.map((icon) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Set the selected option based on the tapped icon label
                          if (icon.label == 'CheckIn') {
                            selectedOption = AttendanceOption.CheckIn;
                          } else if (icon.label == 'CheckOut') {
                            selectedOption = AttendanceOption.CheckOut;
                          } else if (icon.label == 'MeetingIn') {
                            selectedOption = AttendanceOption.MeetingIn;
                          } else if (icon.label == 'MeetingOut') {
                            selectedOption = AttendanceOption.MeetingOut;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: selectedOption == AttendanceOption.CheckIn &&
                                    icon.label == 'CheckIn'
                                ? Colors.blue // Highlight when selected
                                : selectedOption == AttendanceOption.CheckOut &&
                                        icon.label == 'CheckOut'
                                    ? Colors.blue // Highlight when selected
                                    : selectedOption ==
                                                AttendanceOption.MeetingIn &&
                                            icon.label == 'MeetingIn'
                                        ? Colors.blue // Highlight when selected
                                        : selectedOption ==
                                                    AttendanceOption
                                                        .MeetingOut &&
                                                icon.label == 'MeetingOut'
                                            ? Colors
                                                .blue // Highlight when selected
                                            : Colors.grey, // Default color
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              icon.imagePath,
                              width: 50,
                              height: 40,
                            ),
                            SizedBox(height: 5),
                            Text(
                              icon.label,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                    height: 50,
                    width: 300,
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
                      decoration: InputDecoration(labelText: '    PIN     '),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () async {
                    await takePhoto();
                  },
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.cyanAccent,
                  // ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // lib/assets/icons8-photo-gallery-80.png
                      Icon(Icons.camera_alt_outlined, size: 45),
                      SizedBox(width: 20),
                      Text('Take Photo'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Container(
                width: 190,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    await submitAttendance();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text('Mark Attendance'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> takePhoto() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front, // Specify front camera
      );

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

      // Record the timestamp for the check-in
      DateTime checkInTime = DateTime.now();

      // Implement your logic to submit the attendance data to a database or API
      // For example, you might send the selected employee's ID, check-in time,
      // and the captured image to your backend server.

      // Reset the form after submission
      setState(() {
        selectedEmployee = null;
        pinController.clear();
        capturedImage = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Attendance marked for ${selectedEmployee!.name}'),
        ),
      );

      // You may want to navigate back to the login page or any other page after marking attendance
      // Navigator.of(context).pop();
    } catch (error) {
      print('Error submitting attendance: $error');
    }
  }
}
