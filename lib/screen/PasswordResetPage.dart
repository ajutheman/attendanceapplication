import 'package:flutter/material.dart';

import '../utils.dart';

class PasswordForgotPage extends StatefulWidget {
  @override
  _PasswordForgotPageState createState() => _PasswordForgotPageState();
}

class _PasswordForgotPageState extends State<PasswordForgotPage> {
  Company? selectedCompany;
  User? selectedUser;
  String? email;
  String? branch;
  String? newPassword;

  String reEnteredPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Forgot'),
      ),
      body:
          //   Stack(
          //     children: [
          //   // Your Lottie animation widget
          //   Positioned.fill(
          //   child: Lottie.asset(
          //     'lib/assets/Animation.json',
          //     // You can customize the animation size, speed, etc. here
          //   ),
          // ),
          SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                padding: EdgeInsets.all(10.0),
                child: DropdownButtonFormField<Company>(
                  value: selectedCompany,
                  hint: Text('Select Company'),
                  items: companies
                      .map((company) => DropdownMenuItem(
                            value: company,
                            child: Text(company.companyName),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCompany = value;
                      selectedUser = null;
                    });
                  },
                ),
              ),
              SizedBox(height: 20.0),
              if (selectedCompany != null)
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<User>(
                    value: selectedUser,
                    hint: Text('Select Role'),
                    items: selectedCompany!.users
                        .map((user) => DropdownMenuItem(
                              value: user,
                              child: Text(user.role),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedUser = value;
                      });
                    },
                  ),
                ),
              SizedBox(height: 20.0),
              if (selectedUser != null)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                          color: Colors.black),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              SizedBox(height: 20.0),
              if (email != null)
                ElevatedButton(
                  onPressed: () {
                    // Validate email logic
                  },
                  child: Text('Validate Email'),
                ),
              SizedBox(height: 20.0),
              if (email != null)
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    hint: Text('Select Branch'),
                    value: branch,
                    items: selectedCompany!.branches
                        .map((branch) => DropdownMenuItem(
                              value: branch,
                              child: Text(branch),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    },
                  ),
                ),
              SizedBox(height: 20.0),
              if (branch != null)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter New Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                          color: Colors.black),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      newPassword = value;
                    });
                  },
                ),
              SizedBox(height: 16),
              if (branch != null)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Re-enter Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                          color: Colors.black),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      reEnteredPassword = value;
                    });
                  },
                  validator: (value) {
                    if (value != newPassword) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              if (newPassword != null) SizedBox(height: 20.0),
              if (newPassword != null)
                ElevatedButton(
                  onPressed: () {
                    // Password change logic
                  },
                  child: Text('Change Password'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
