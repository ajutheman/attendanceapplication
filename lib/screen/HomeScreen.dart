import 'package:flutter/material.dart';

import 'Admin/AdminViewPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Office View'),
      ),
      body: Center(
        child: Text('Office View'),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.65,
        backgroundColor: Colors.grey,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  // const SizedBox(height: 10),
                  Center(
                    child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage:
                            // user?.photoURL == null
                            //     ? const
                            AssetImage("lib/assets/image-not-avaliable.png")
                        //     : NetworkImage(user?.photoURL as String)
                        // as ImageProvider<Object>?,
                        ),
                  ),
                  Text(
                    "displayName",
                    // user?.displayName as String,
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 0.6,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "email",
                    // user?.email as String,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.logout),
            //   title: const Text(
            //     "Daily Attendance Report",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       letterSpacing: 0.8,
            //     ),
            //   ),
            //   onTap: () {
            //     // _logout(context);
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.logout),
            //   title: const Text(
            //     "Weekly Attendance Report",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       letterSpacing: 0.8,
            //     ),
            //   ),
            //   onTap: () {
            //     // _logout(context);
            //
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.logout),
            //   title: const Text(
            //     "Monthly Attendance Report",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       letterSpacing: 0.8,
            //     ),
            //   ),
            //   onTap: () {
            //     // _logout(context);
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.logout),
            //   title: const Text(
            //     "individualDaily Attendance Report",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       letterSpacing: 0.8,
            //     ),
            //   ),
            //   onTap: () {
            //     // _logout(context);
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.logout),
            //   title: const Text(
            //     "individual Weekly Attendance Report",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       letterSpacing: 0.8,
            //     ),
            //   ),
            //   onTap: () {
            //     // _logout(context);
            //   },
            // ),
            // ListTile(
            //   iconColor: Colors.white,
            //   leading: const Icon(Icons.logout),
            //   title: const Text(
            //     "individual Monthly Attendance Report",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       letterSpacing: 0.8,
            //     ),
            //   ),
            //   onTap: () {
            //     // _logout(context);
            //   },
            // ),
            Divider(
              color: Colors.white,
              indent: 1,
              endIndent: 1,
            ),
            ListTile(
              iconColor: Colors.white,
              leading: const Icon(Icons.logout),
              title: const Text(
                "admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.8,
                ),
              ),
              onTap: () {
                MaterialPageRoute(
                  builder: (context) => AdminViewPage(),
                );
                // ,
                // _logout(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
            ),
            ListTile(
              leading: const Icon(
                Icons.verified_outlined,
                color: Colors.white,
              ),
              title: const Text(
                "Version 1.0.2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 0.8,
                ),
              ),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
