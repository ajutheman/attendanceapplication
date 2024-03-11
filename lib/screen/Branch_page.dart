import 'package:flutter/material.dart';

import 'MastersPage.dart';
import 'ProfilePage.dart';
import 'attendanceMarkingPage.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          // Add your screens here
          // DailyAttendanceScreen(),
          // HomeScreen(),
          // AccountScreen(),
          // AdminViewPage(),
          AttendancePagemark(),
          // AdminViewPage(),
          MastersPage(),
          ProfilePage(),
          // EmployeeDetailPage(),
          // AccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: const Color.fromRGBO(97, 53, 124, 1),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: "Mark Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "MastersPage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_outlined),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
