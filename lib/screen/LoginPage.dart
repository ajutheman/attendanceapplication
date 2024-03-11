// import 'package:flutter/material.dart';
//
// // import 'AttendancePage.dart';
// import 'AdminViewPage.dart';
// import 'AttendancePage.dart';
// import 'MastersPage.dart';
//
// // import '../../modle/user_types.dart';
// // import 'Attendance_page.dart';
//
// // Define a class for user data
// class User {
//   final String username;
//   final String password;
//   final UserType userType;
//
//   User({
//     required this.username,
//     required this.password,
//     required this.userType,
//   });
// }
//
// // Define an enum for user types
// enum UserType {
//   admin,
//   masters,
//   employee,
// }
//
// // Sample users
// final List<User> users = [
//   User(username: 'admin', password: 'adminpass', userType: UserType.admin),
//   User(username: 'master', password: 'masterpass', userType: UserType.masters),
//   // Add more employee users as needed
//   User(
//       username: 'employee1', password: 'emp1pass', userType: UserType.employee),
//   User(
//       username: 'employee2', password: 'emp2pass', userType: UserType.employee),
// ];
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   String? errorText;
//   final usernameFocusNode = FocusNode();
//   final passwordFocusNode = FocusNode();
//
//   bool isPasswordVisible = false;
//   bool isLoading = false;
//
//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     usernameFocusNode.dispose();
//     passwordFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Login')),
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Text("Welcome Back ",
//                   style: TextStyle(
//                       color: Colors.cyanAccent, height: 1, fontSize: 30)),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               padding: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 border: Border.all(
//                   color: usernameFocusNode.hasFocus
//                       ? Colors.blue // Change border color when focused
//                       : Colors.cyanAccent,
//                 ),
//               ),
//               child: TextField(
//                 controller: usernameController,
//                 focusNode: usernameFocusNode,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               padding: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 border: Border.all(
//                   color: passwordFocusNode.hasFocus
//                       ? Colors.blue // Change border color when focused
//                       : Colors.cyanAccent,
//                 ),
//               ),
//               child: TextField(
//                 controller: passwordController,
//                 focusNode: passwordFocusNode,
//                 obscureText: !isPasswordVisible,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: InputBorder.none,
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             if (errorText != null)
//               Text(
//                 errorText!,
//                 style: TextStyle(color: Colors.red),
//               ),
//             SizedBox(width: 120, height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 290,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary:
//                           isLoading ? Colors.greenAccent : Colors.cyanAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     onPressed: () async {
//                       // Show loading indicator
//                       setState(() {
//                         isLoading = true;
//                       });
//
//                       // Simulate a delay for authentication (replace with actual authentication logic)
//                       await Future.delayed(Duration(seconds: 1));
//
//                       // Stop loading indicator
//                       setState(() {
//                         isLoading = false;
//                       });
//
//                       // Implement login authentication logic here
//                       String username = usernameController.text;
//                       String password = passwordController.text;
//
//                       if (isValidLogin(username, password)) {
//                         // Navigate to the home page based on the user type
//                         navigateToHomePage(context, getUserType(username));
//                       } else {
//                         // Set an error message if authentication fails
//                         setState(() {
//                           errorText = 'Invalid username or password';
//                         });
//                       }
//                     },
//                     child: isLoading
//                         ? CircularProgressIndicator(
//                             valueColor:
//                                 AlwaysStoppedAnimation<Color>(Colors.black),
//                           )
//                         : Text('Login'),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     Navigator.pushReplacement(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //         builder: (context) => AttendancePage(),
//                 //       ),
//                 //     );
//                 //   },
//                 //   child: Text('Attendance'),
//                 // ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool isValidLogin(String username, String password) {
//     // Check if there is a user with the given credentials
//     return users
//         .any((user) => user.username == username && user.password == password);
//   }
//
//   UserType getUserType(String username) {
//     // Find the user and return its userType
//     final user = users.firstWhere(
//       (user) => user.username == username,
//       orElse: () => User(
//           username: '',
//           password: '',
//           userType: UserType.admin), // Default to admin if user is not found
//     );
//     return user.userType;
//   }
//
//   void navigateToHomePage(BuildContext context, UserType userType) {
//     switch (userType) {
//       case UserType.admin:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AdminViewPage(),
//           ),
//         );
//         break;
//       case UserType.masters:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MastersPage(),
//           ),
//         );
//         break;
//       case UserType.employee:
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AttendancePage(),
//           ),
//         );
//         break;
//     }
//   }
// }
// //
// // class AdminHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Admin Home'),
// //       ),
// //       body: Center(
// //         child: Text('Welcome Admin!'),
// //       ),
// //     );
// //   }
// // }
// //
// // class MastersHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Masters Home'),
// //       ),
// //       body: Center(
// //         child: Text('Welcome Masters!'),
// //       ),
// //     );
// //   }
// // }
