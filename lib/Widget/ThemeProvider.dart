// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ThemeProvider with ChangeNotifier {
//   bool _darkMode = false;
//
//   ThemeData get theme => _darkMode ? darkTheme : lightTheme;
//
//   bool get isDarkMode => _darkMode;
//
//   void toggleDarkMode(bool value) async {
//     _darkMode = value;
//     notifyListeners();
//     _saveSettings(); // Persist setting
//   }
//
//   Future<void> _loadSettings() async {
//     final prefs = await SharedPreferences.getInstance();
//     _darkMode = prefs.getBool('darkMode') ?? false;
//     notifyListeners();
//   }
//
//   Future<void> _saveSettings() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('darkMode', _darkMode);
//   }
//
//   ThemeProvider() {
//     _loadSettings();
//   }
// }
