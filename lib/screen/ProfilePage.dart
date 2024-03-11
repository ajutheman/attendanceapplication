import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attendanceMarkingPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _companyCode = 'UBEPSX';
  bool _isVIPMember = false;
  List<CustomIcon> customIcons = [
    CustomIcon(imagePath: 'lib/assets/attendance-logo.png', label: '  Profile'),
    CustomIcon(
        imagePath: 'lib/assets/icons8-check-in-64.png',
        label: 'View Attendance '),
    CustomIcon(
        imagePath: 'lib/assets/icons8-set-alarm-64.png', label: 'Set Alarm '),
    CustomIcon(imagePath: 'lib/assets/icons8-notes-16.png', label: 'Notes'),
    CustomIcon(
        imagePath: 'lib/assets/icons8-holiday-50.png', label: 'Holiday List'),
    CustomIcon(
        imagePath: 'lib/assets/icons8-add-properties-50.png',
        label: 'Add Business'),
    CustomIcon(
        imagePath: 'lib/assets/icons8-documents-48.png', label: 'My Documents'),
    //,,
    // Add more custom icons as needed
  ];
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _companyCode = prefs.getString('companyCode') ?? 'UBEPSX';
      _isVIPMember = prefs.getBool('isVIPMember') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Image and Name
            Row(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                        'lib/assets/attendance-logo.png'), // Replace with your image path
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _companyCode,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),

            // VIP Membership (Optional)
            if (_isVIPMember)
              Card(
                child: ListTile(
                  title: Text('VIP Membership'),
                  subtitle: Text('Track daily staff attendance and more'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    // Implement navigation or actions for VIP membership
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GridView.count(
                    crossAxisCount: 3, // Number of columns in the grid
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    children: customIcons.map((icon) {
                      return GestureDetector(
                        onTap: () {
                          // Handle icon selection
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Custom PNG icon images
                              Image.asset(
                                icon.imagePath,
                                width:
                                    50, // Adjust the size of the icon as needed
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
                ],
              ),
            ),

            // Settings List
          ],
        ),
      ),
    );
  }
}
