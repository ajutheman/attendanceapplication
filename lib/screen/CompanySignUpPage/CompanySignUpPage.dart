import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Modle/User_data_modle.dart';
import '../../Modle/userData.dart';

class CompanySignUpPage extends StatefulWidget {
  @override
  _CompanySignUpPageState createState() => _CompanySignUpPageState();
}

class _CompanySignUpPageState extends State<CompanySignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _numberOfStaffController = TextEditingController();
  TextEditingController _numberOfBranchesController = TextEditingController();
  TextEditingController _officeTimingController = TextEditingController();
  TextEditingController _branchController = TextEditingController();
  bool _addEmployee = false;
  File? _image;
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      // Store image file path in Hive
      final imageBox = await Hive.openBox<String>('images');
      imageBox.put('imagePath', pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            double screenHeight = sizingInformation.screenSize.height;

            if (screenWidth >= 768 || orientation == Orientation.landscape) {
              // Tablet and desktop layout
              return buildTabletDesktopLayout();
            } else {
              // Mobile layout
              return buildMobileLayout();
            }
          },
        );
      },
    );
  }

  Widget buildTabletDesktopLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Container(
                            // height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Image.asset("lib/assets/login.png")),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.blueGrey;
                                } else {
                                  return Colors.white;
                                }
                              }),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            onPressed: _pickImage,
                            icon: Icon(Icons.image),
                            label: Text('Pick Image'),
                          ),
                        ),
                        if (_image != null) Image.file(_image!),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 38.0, right: 18, top: 20, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _companyNameController,
                          decoration: InputDecoration(
                            labelText: 'Company Name',
                            prefixIcon: const Icon(
                              Icons.home_work,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the company name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.password_outlined,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(
                              Icons.password_outlined,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _numberOfStaffController,
                          decoration: InputDecoration(
                            labelText: 'Number of Staff',
                            prefixIcon: const Icon(
                              Icons.group_add,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the number of staff';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _numberOfBranchesController,
                          decoration: InputDecoration(
                            labelText: 'Number of Branches',
                            prefixIcon: const Icon(
                              Icons.add_home_work,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the number of branches';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _branchController,
                          decoration: InputDecoration(
                            labelText: 'Branch_location',
                            prefixIcon: const Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter branch';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        SizedBox(height: 16),
                        CheckboxListTile(
                          title: Text('Add Employee'),
                          value: _addEmployee,
                          onChanged: (value) {
                            setState(() {
                              _addEmployee = value!;
                            });
                          },
                        ),
                        if (_addEmployee) ...{
                          ListTile(
                            title: Text('Add New Employee'),
                            onTap: () {
                              // Show dialog to add new employee
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // Define variables to hold the employee details
                                  String name = '';
                                  String id = '';
                                  String imageUrl = '';
                                  String pin = '';
                                  String designation = '';
                                  String contactInformation = '';
                                  String officeTiming = '';

                                  return AlertDialog(
                                    title: Text('Add New Employee'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Name',
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              name = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'ID',
                                              prefixIcon: const Icon(
                                                Icons.pin,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              id = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Image URL',
                                              prefixIcon: const Icon(
                                                Icons.image,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              imageUrl = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'PIN',
                                              prefixIcon: const Icon(
                                                Icons.password_outlined,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              pin = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Designation',
                                              prefixIcon: const Icon(
                                                Icons.design_services_outlined,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              designation = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Contact Information',
                                              prefixIcon: const Icon(
                                                Icons.phone,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              contactInformation = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TextFormField(
                                            controller: _officeTimingController,
                                            decoration: InputDecoration(
                                              labelText: 'Office Timing',
                                              prefixIcon: const Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.solid,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onTap: () async {
                                              // Show time picker dialog
                                              TimeOfDay? pickedTime =
                                                  await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              // Update the text field with the picked time
                                              if (pickedTime != null) {
                                                setState(() {
                                                  _officeTimingController.text =
                                                      '${pickedTime.hour}:${pickedTime.minute}';
                                                });
                                              }
                                            },
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please select office timing';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // Close dialog
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Implement adding new employee functionality
                                          // Create a new employee object with the entered details
                                          UserDataModel newEmployee =
                                              UserDataModel(
                                            name: name,
                                            id: id,
                                            imageUrl: imageUrl,
                                            pin: pin,
                                            designation: designation,
                                            contactInformation:
                                                contactInformation,
                                            officeTiming: officeTiming,
                                          );
                                          setState(() {
                                            Userdata.userdatalist.add(
                                                newEmployee); // Add new employee to the list
                                          });
                                          Navigator.pop(
                                              context); // Close dialog
                                        },
                                        child: Text('Add'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        }, // Assuming UserDataModel has properties like name, id, etc.
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Implement sign-up logic here
                              // You can access the form fields using _companyNameController.text, _emailController.text, etc.
                              // For example, you can make an API call to register the company
                            }
                          },
                          child: Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 48.0, right: 48, top: 30),
                child: Image.asset("lib/assets/login.png"),
              ),
              TextFormField(
                controller: _companyNameController,
                decoration: InputDecoration(
                  labelText: 'Company Name',
                  prefixIcon: const Icon(
                    Icons.home_work,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _numberOfStaffController,
                decoration: InputDecoration(
                  labelText: 'Number of Staff',
                  prefixIcon: const Icon(
                    Icons.group_add,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of staff';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _numberOfBranchesController,
                decoration: InputDecoration(
                  labelText: 'Number of Branches',
                  prefixIcon: const Icon(
                    Icons.add_home_work,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the number of branches';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _branchController,
                decoration: InputDecoration(
                  labelText: 'Branch_location',
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.solid,
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter branch';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blueGrey;
                      } else {
                        return Colors.white;
                      }
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: _pickImage,
                  icon: Icon(Icons.image),
                  label: Text('Pick Image'),
                ),
              ),
              if (_image != null) Image.file(_image!),

              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Add Employee'),
                value: _addEmployee,
                onChanged: (value) {
                  setState(() {
                    _addEmployee = value!;
                  });
                },
              ),
              if (_addEmployee) ...{
                ListTile(
                  title: Text('Add New Employee'),
                  onTap: () {
                    // Show dialog to add new employee
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Define variables to hold the employee details
                        String name = '';
                        String id = '';
                        String imageUrl = '';
                        String pin = '';
                        String designation = '';
                        String contactInformation = '';
                        String officeTiming = '';

                        return AlertDialog(
                          title: Text('Add New Employee'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    name = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'ID',
                                    prefixIcon: const Icon(
                                      Icons.pin,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    id = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Image URL',
                                    prefixIcon: const Icon(
                                      Icons.image,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    imageUrl = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'PIN',
                                    prefixIcon: const Icon(
                                      Icons.password_outlined,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    pin = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Designation',
                                    prefixIcon: const Icon(
                                      Icons.design_services_outlined,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    designation = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Contact Information',
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    contactInformation = value;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _officeTimingController,
                                  decoration: InputDecoration(
                                    labelText: 'Office Timing',
                                    prefixIcon: const Icon(
                                      Icons.access_time,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    // Show time picker dialog
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    // Update the text field with the picked time
                                    if (pickedTime != null) {
                                      setState(() {
                                        _officeTimingController.text =
                                            '${pickedTime.hour}:${pickedTime.minute}';
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please select office timing';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close dialog
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Implement adding new employee functionality
                                // Create a new employee object with the entered details
                                UserDataModel newEmployee = UserDataModel(
                                  name: name,
                                  id: id,
                                  imageUrl: imageUrl,
                                  pin: pin,
                                  designation: designation,
                                  contactInformation: contactInformation,
                                  officeTiming: officeTiming,
                                );
                                setState(() {
                                  Userdata.userdatalist.add(
                                      newEmployee); // Add new employee to the list
                                });
                                Navigator.pop(context); // Close dialog
                              },
                              child: Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              }, // Assuming UserDataModel has properties like name, id, etc.

              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implement sign-up logic here
                    // You can access the form fields using _companyNameController.text, _emailController.text, etc.
                    // For example, you can make an API call to register the company
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
