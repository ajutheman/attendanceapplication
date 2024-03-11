// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   bool _darkMode = false;
//   String _companyCode = 'UBEPSX';
//   bool _isVIPMember = false;
//
//   Future<void> _loadSettings() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _darkMode = prefs.getBool('darkMode') ?? false;
//       _companyCode = prefs.getString('companyCode') ?? 'UBEPSX';
//       _isVIPMember = prefs.getBool('isVIPMember') ?? false;
//     });
//   }
//
//   Future<void> _saveSettings() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('darkMode', _darkMode);
//     await prefs.setString('companyCode', _companyCode);
//     await prefs.setBool('isVIPMember', _isVIPMember);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             // Using Column instead of ListView for vertical arrangement
//             children: <Widget>[
//               Card(
//                 child: ListTile(
//                   title: Text('Company name'),
//                   leading: CircleAvatar(
//                     child: Icon(Icons.list_alt_outlined),
//                   ),
//                   onTap: () {
//                     // Implement navigation or actions
//                   },
//                 ),
//               ),
//               Text(
//                 "Suggested Feature",
//                 style: TextStyle(
//                   fontSize: 20,
//                   // Import the required library for textAlign
//                 ),
//                 textAlign: TextAlign.start,
//               ),
//               Row(
//                 children: [
//                   // Wrap GridTile cards within a Column for correct layout
//                   Expanded(
//                     // Wrap the Column with Expanded to allow scrolling
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal, // Scroll horizontally
//                       child: Row(
//                         children: [
//                           for (int i = 1; i <= 5; i++)
//                             Card(
//                               color: Colors.lightBlue,
//                               child: GridTile(
//                                 child: Container(
//                                   padding: EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Icon(Icons.emoji_objects, size: 50),
//                                       Text('Tile $i'),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Card(
//                 child: SwitchListTile(
//                   title: Text('Dark Mode'),
//                   value: _darkMode,
//                   onChanged: (value) {
//                     setState(() {
//                       _darkMode = value;
//                       _saveSettings(); // Persist setting
//                     });
//                   },
//                 ),
//               ),
//               Card(
//                 child: ListTile(
//                   title: Text('Company Code'),
//                   leading: Icon(Icons.list_alt_outlined),
//                   subtitle: Text('Shere this code  staff '),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(_companyCode),
//                       IconButton(
//                         icon: Icon(Icons.share),
//                         onPressed: () {
//                           // Implement share functionality
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 child: ListTile(
//                   title: Text('VIP Membership'),
//                   subtitle: Text('Track daily staff attendance and more'),
//                   trailing: Icon(Icons.arrow_right),
//                   onTap: () {
//                     // Navigate or handle actions
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../EmployeeManagement/EmployeeManagementPage.dart';
import '../EmployeeManagement/buildCompanyManagementTile.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  String _companyCode = 'UBEPSX';
  bool _isVIPMember = false;

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    // Define other light mode attributes
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Define other dark mode attributes
  );

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
    _saveSettings(); // Persist setting
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = prefs.getBool('darkMode') ?? false;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', _darkMode);
  }

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkMode ? darkTheme : lightTheme, // Apply selected theme
      home: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    title: Text('Company name'),
                    leading: CircleAvatar(
                      child: Icon(Icons.list_alt_outlined),
                    ),
                    onTap: () {
                      // Implement navigation or actions
                    },
                  ),
                ),
                Text(
                  "Suggested Feature",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 1; i <= 5; i++)
                              Card(
                                color: Colors.lightBlue,
                                child: GridTile(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.emoji_objects, size: 50),
                                        Text('Tile $i'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  child: SwitchListTile(
                    title: Text('Dark Mode'),
                    value: _darkMode,
                    onChanged: _toggleDarkMode,
                  ),
                ),
                EmployeeManagementPage(),
                buildCompanyManagementTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
