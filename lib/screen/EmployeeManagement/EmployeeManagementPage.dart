import 'package:flutter/material.dart';

import '../../Modle/User_data_modle.dart';
import '../../Modle/userData.dart';

class EmployeeManagementPage extends StatefulWidget {
  @override
  State<EmployeeManagementPage> createState() => _EmployeeManagementPageState();
}

class _EmployeeManagementPageState extends State<EmployeeManagementPage> {
  @override
  String name = '';

  String id = '';

  String imageUrl = '';

  String pin = '';

  String designation = '';

  String contactInformation = '';

  String officeTiming = '';

  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text('Employee Management'),
        children: [
          // ListTile(
          //   title: Text('Add New Employee'),
          //   onTap: () {
          //     // Show dialog to add new employee
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return AlertDialog(
          //           title: Text('Add New Employee'),
          //           content: SingleChildScrollView(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.stretch,
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 TextField(
          //                   decoration: InputDecoration(labelText: 'Name'),
          //                   onChanged: (value) {
          //                     name = value;
          //                   },
          //                 ),
          //                 TextField(
          //                   decoration: InputDecoration(labelText: 'ID'),
          //                   onChanged: (value) {
          //                     id = value;
          //                   },
          //                 ),
          //                 TextField(
          //                   decoration: InputDecoration(labelText: 'Image URL'),
          //                   onChanged: (value) {
          //                     imageUrl = value;
          //                   },
          //                 ),
          //                 TextField(
          //                   decoration: InputDecoration(labelText: 'PIN'),
          //                   onChanged: (value) {
          //                     pin = value;
          //                   },
          //                 ),
          //                 TextField(
          //                   decoration:
          //                   InputDecoration(labelText: 'Designation'),
          //                   onChanged: (value) {
          //                     designation = value;
          //                   },
          //                 ),
          //                 TextField(
          //                   decoration: InputDecoration(
          //                       labelText: 'Contact Information'),
          //                   onChanged: (value) {
          //                     contactInformation = value;
          //                   },
          //                 ),
          //                 TextField(
          //                   decoration:
          //                   InputDecoration(labelText: 'Office Timing'),
          //                   onChanged: (value) {
          //                     officeTiming = value;
          //                   },
          //                 ),
          //               ],
          //             ),
          //           ),
          //           actions: [
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.pop(context); // Close dialog
          //               },
          //               child: Text('Cancel'),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 // Implement adding new employee functionality
          //                 // Create a new employee object with the entered details
          //                 UserDataModel newEmployee = UserDataModel(
          //                   name: name,
          //                   id: id,
          //                   imageUrl: imageUrl,
          //                   pin: pin,
          //                   designation: designation,
          //                   contactInformation: contactInformation,
          //                   officeTiming: officeTiming,
          //                 );
          //                 setState(() {
          //                   Userdata.userdatalist.add(
          //                       newEmployee); // Add new employee to the list
          //                 });
          //                 Navigator.pop(context); // Close dialog
          //               },
          //               child: Text('Add'),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          // ),

          ListTile(
            title: Text('Add New Employee'),
            onTap: () {
              // Show dialog to add new employee
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add New Employee'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Name'),
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'ID'),
                            onChanged: (value) {
                              id = value;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Image URL'),
                            onChanged: (value) {
                              imageUrl = value;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'PIN'),
                            onChanged: (value) {
                              pin = value;
                            },
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Designation'),
                            onChanged: (value) {
                              designation = value;
                            },
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Contact Information'),
                            onChanged: (value) {
                              contactInformation = value;
                            },
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Office Timing'),
                            onChanged: (value) {
                              officeTiming = value;
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
          ListTile(
            title: Text('Delete Employee'),
            onTap: () {
              // Show confirmation dialog before deleting
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select Employee to Delete'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Show list of employees
                          for (var employee in Userdata.userdatalist)
                            ListTile(
                              title: Text(employee.name),
                              onTap: () {
                                // Show confirmation dialog for delete
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Confirm Delete'),
                                      content: Text(
                                          'Are you sure you want to delete this employee?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close confirmation dialog
                                          },
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Implement delete employee functionality
                                            setState(() {
                                              Userdata.userdatalist
                                                  .remove(employee);
                                            });
                                            Navigator.pop(
                                                context); // Close confirmation dialog
                                            Navigator.pop(
                                                context); // Close employee selection dialog
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text('Edit Employee Details'),
            onTap: () {
              // Show dialog to choose employee to edit
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select Employee to Edit'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Show list of employees
                          for (var employee in Userdata.userdatalist)
                            ListTile(
                              title: Text(employee.name),
                              onTap: () {
                                // Show dialog to edit employee details
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // Variables to hold the updated employee details
                                    String id = employee.id ?? '';
                                    String imageUrl = employee.imageUrl ?? '';
                                    String pin = employee.pin ?? '';
                                    String designation =
                                        employee.designation ?? '';
                                    String contactInformation =
                                        employee.contactInformation ?? '';
                                    String officeTiming =
                                        employee.officeTiming ?? '';

                                    return AlertDialog(
                                      title: Text('Edit Employee Details'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Name'),
                                              onChanged: (value) {
                                                employee.name =
                                                    value; // Update the name directly in the employee object
                                              },
                                              controller: TextEditingController(
                                                  text: employee.name),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'ID'),
                                              onChanged: (value) {
                                                id = value;
                                              },
                                              controller: TextEditingController(
                                                  text: employee.id),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Image URL'),
                                              onChanged: (value) {
                                                imageUrl = value;
                                              },
                                              controller: TextEditingController(
                                                  text: employee.imageUrl),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'PIN'),
                                              onChanged: (value) {
                                                pin = value;
                                              },
                                              controller: TextEditingController(
                                                  text: employee.pin),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Designation'),
                                              onChanged: (value) {
                                                designation = value;
                                              },
                                              controller: TextEditingController(
                                                  text: employee.designation),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText:
                                                      'Contact Information'),
                                              onChanged: (value) {
                                                contactInformation = value;
                                              },
                                              controller: TextEditingController(
                                                  text: employee
                                                      .contactInformation),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                  labelText: 'Office Timing'),
                                              onChanged: (value) {
                                                officeTiming = value;
                                              },
                                              controller: TextEditingController(
                                                  text: employee.officeTiming),
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
                                            // Implement editing employee details functionality
                                            // Update the selected employee's details with the modified values
                                            employee.id = id;
                                            employee.imageUrl = imageUrl;
                                            employee.pin = pin;
                                            employee.designation = designation;
                                            employee.contactInformation =
                                                contactInformation;
                                            employee.officeTiming =
                                                officeTiming;

                                            setState(() {
                                              // Manually trigger the UI update
                                            });

                                            Navigator.pop(
                                                context); // Close dialog
                                            Navigator.pop(
                                                context); // Close the employee selection dialog
                                          },
                                          child: Text('Save'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
